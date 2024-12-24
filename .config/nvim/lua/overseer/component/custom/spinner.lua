local notify = require("notify")

return {
  desc = "Keep a notification that the task is running",
  -- Define parameters that can be passed in to the component
  params = {
    -- See :help overseer-params
  },
  -- Optional, default true. Set to false to disallow editing this component in the task editor
  editable = true,
  -- Optional, default true. When false, don't serialize this component when saving a task to disk
  serializable = true,
  -- The params passed in will match the params defined above
  constructor = function(params)
    local spinner_frames = require('overseer.component.custom.spinner_patterns').dots_pulse
    -- You may optionally define any of the methods below
    return {
        task_done = false,
        spinner_index = 0,
        notifyRecord = nil,
        _runNotify = function(self, task)
            if(self.task_done) then
                return
            end

            if self.notifyRecord then
                self.notifyRecord = notify(nil, nil, {
                    hide_from_history = true,
                    icon = spinner_frames[self.spinner_index + 1],
                    replace = self.notifyRecord
                })
            else
                local message = string.format("%s %s", "Running Task  ", task.name)
                self.notifyRecord = notify(message, "info", {
                    timeout = false,
                    icon = spinner_frames[self.spinner_index + 1],
                })
            end

            self.spinner_index = (self.spinner_index + 1) % #spinner_frames

            vim.defer_fn(function()
                self:_runNotify(task)
            end, 250)
        end,

        on_start = function(self, task)
            -- Called when the task is started
            self:_runNotify(task)
        end,

        on_reset = function(self, task)
            -- Called when the task is reset
            self.task_done = false
            self.spinner_index = 0
            self.notifyRecord = nil
            self:_runNotify(task)
        end,

        on_complete = function(self, task, status, result)
            -- Called when the task has reached a completed state.
            self.task_done = true
            notify.dismiss({ silent = true, pending = true })
        end,
    }
  end,
}

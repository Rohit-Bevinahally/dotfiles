#!/bin/bash

for file in "$@"; do
    dir="$(dirname "$file")"
    case "$file" in
        *.zip)
            unzip -o "$file" -d "$dir"
            ;;
        *.tar.gz|*.tgz)
            tar -xzf "$file" -C "$dir"
            ;;
        *.tar.bz2|*.tbz2)
            tar -xjf "$file" -C "$dir"
            ;;
        *.tar.xz|*.txz)
            tar -xJf "$file" -C "$dir"
            ;;
        *.7z)
            7z x "$file" -o"$dir"
            ;;
        *.rar)
            unrar x "$file" "$dir"
            ;;
        *)
            echo "Unsupported archive: $file" >&2
            ;;
    esac
done

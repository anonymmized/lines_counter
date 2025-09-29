#!/bin/bash

scan_dir() {
    local DIR EXT 
    local cnt=0

    while true; do
        read -r -p "Enter the full path to the directory: " DIR
        if [ ! -d "$DIR" ]; then
            echo "Such a directory does not exist. Try again"
        else 
            break
        fi
    done

    read -r -p "Enter extension for which to perform a script (py | cpp | pdf): " EXT

    find "$DIR" -type f -name "*.$EXT" | while IFS= read -r f; do
        ((cnt++))
        lines_cnt=$(wc -l < "$f")
        echo "For found file $f total lines: $lines_cnt"
    done

    echo "Total files found: $cnt"
}

scan_dir
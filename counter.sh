#!/bin/bash

scan_dir() {
    local DIR exts 
    local cnt=0
    local total_cnt=0

    while true; do
        read -r -p "Enter the full path to the directory: " DIR
        if [ ! -d "$DIR" ]; then
            echo "Such a directory does not exist. Try again"
        else 
            break
        fi
    done

    read -r -p "Enter extension for which to perform a script (py | cpp | pdf): " exts
    for EXT in $exts; do
        while IFS= read -r -d '' f; do
            ((cnt++))
            lines_cnt=$(wc -l < "$f")
            total_cnt=$((total_cnt + lines_cnt))
            printf "For found file %s total lines: %d\n" "$f" "$lines_cnt"
        done < <(find "$DIR" -type f -name "*.$EXT" -print0)
    done

    echo "Total files found: $cnt"
    echo "Total lines found: $total_cnt"
}


scan_dir
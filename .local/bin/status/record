#!/bin/sh

# blink=$(date +%s)
# if [ $((blink % 2)) -eq 0 ]; then
#     echo " REC"
# else
#     echo "  REC"
# fi

printf "%s" "$(\
if pgrep -f ffmpeg > /dev/null 2>&1; then \
    blink=$(date +%s); \
    if [ $((blink % 2)) -eq 0 ]; then \
        echo "  REC"; \
    else \
        echo "   REC";
    fi; \
else \
    echo ""; \
fi)"

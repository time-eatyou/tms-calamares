#!/bin/bash
# 保存为 add_empty_folders.sh

echo "正在查找并处理空文件夹..."

# 查找所有空文件夹并创建 .gitkeep
find . -type d -empty | while read dir; do
    if [ ! -f "$dir/.gitkeep" ]; then
        touch "$dir/.gitkeep"
        echo "✅ 已创建: $dir/.gitkeep"
    fi
done

echo "处理完成！"

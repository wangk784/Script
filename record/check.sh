#!/bin/sh
# for FILE in $HOME/Documents/workspace/youybs-client/proj.*
# do
#    # echo $FILE
# done

# 枚举一个目录中的所有文件夹
direc="$HOME/Documents/workspace/youybs-client/" #$(pwd)
desktopDirect="$HOME/Desktop/test2"
for dir2cp in $direc/* ; do
if [ -d $dir2cp ]; then
  cp -R $dir2cp $desktopDirect
  echo "已复制$dir2cp"
fi
done

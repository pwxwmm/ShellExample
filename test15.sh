场景：记录目录下文件操作。
需先安装inotify-tools软件包。

#!/bin/bash
MON_DIR=/opt
inotifywait -mq --format %f -e create $MON_DIR |\
while read files; do
  echo $files >> test.log
done


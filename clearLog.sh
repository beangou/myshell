# 定期清理 当天前的每天日志文件
# 在以下脚本中，`catalina.[0-9]{4}-[0-9]{2}-[0-9]{2}.out` 正则表达式用于匹配日志文件名，确保文件名以 "catalina." 开头，然后是日期，并以 ".out" 结尾。使用 `${file:9:10}` 获取文件名中的日期，然后将其与当前日期比较，并删除早于当天日期的日志文件。
# 请记得将 `/path/to/log/folder` 替换为你实际的日志文件夹路径，并确保对脚本具备执行权限。
# 接下来，将此脚本添加到定时任务中。通过运行以下命令打开你的定时任务列表：
# 保存并关闭文件后，定时任务将每天的0点0分删除当天之前的日志文件。

#!/bin/bash
# 日志目录
log_folder="/xxx/xxx/xxx/logs"
current_date=$(date +%Y-%m-%d)
echo "time is $current_date"
echo '======='
log_files=$(ls $log_folder)

for file in $log_files
do
if [[ $file =~ ^catalina.[0-9]{4}-[0-9]{2}-[0-9]{2}.out$ ]] && [[ ${file:9:10} < $current_date ]]
then
echo "fileName = $file"
rm $log_folder/$file
fi
done

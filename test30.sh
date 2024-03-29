getopts是一个解析脚本选项参数的工具。
命令格式：getopts optstring name [arg]
初次使用你要注意这几点：
脚本位置参数会与optstring中的单个字母逐个匹配，如果匹配到就赋值给name，否则赋值name为问号；
optstring中单个字母是一个选项，如果字母后面加冒号，表示该选项后面带参数，参数值并会赋值给OPTARG变量；
optstring中第一个是冒号，表示屏蔽系统错误（test.sh: illegal option -- h）；
允许把选项放一起，例如-ab

下面写一个打印文件指定行的简单例子，引导你思路：
#!/bin/bash
while getopts :f:n: option; do
    case $option in
        f)
            FILE=$OPTARG
      [ ! -f $FILE ] && echo "$FILE File not exist!" && exit
            ;;
        n)
            sed -n "${OPTARG}p" $FILE
            ;;
        ?)
            echo "Usage: $0 -f <file_path> -n <line_number>"
            echo "-f, --file           specified file"
            echo "-n, --line-number    print specified line"
            exit 1
        ;;
    esac
done





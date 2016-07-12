#! /bin/sh
echo "Hello World!"

# Author: Eric Wang
# Copyright Euplay

# 交互  读取数据
echo "name:"
read Person
echo "Hello, $Person"

# 定义变量  规则
# 首个字符必须为字母（a-z，A-Z）。
# 中间不能有空格，可以使用下划线（_）。
# 不能使用标点符号。
# 不能使用bash里的关键字（可用help命令查看保留关键字）。
var="value"
echo $var
echo ${var}

# for循环
for skill in c java cpp action
do
	echo "$Person good at ${skill} progrom."
done

# 只读变量
# url="baidu.com"
# readonly url
# url="youku.com"
# This variable is read only

# 删除变量
unset url
echo url

# $0	当前脚本的文件名
# $n	传递给脚本或函数的参数。n 是一个数字，表示第几个参数。例如，第一个参数是$1，第二个参数是$2。
# $#	传递给脚本或函数的参数个数。
# $*	传递给脚本或函数的所有参数。
# $@	传递给脚本或函数的所有参数。被双引号(" ")包含时，与 $* 稍有不同，下面将会讲到。
# $?	上个命令的退出状态，或函数的返回值。
# $$	当前Shell进程ID。对于 Shell 脚本，就是这些脚本所在的进程ID。

echo "以下是\$*和\$@的区别"

# $* 和 $@ 都表示传递给函数或脚本的所有参数，不被双引号(" ")包含时，都以"$1" "$2" … "$n" 的形式输出所有参数。

# 但是当它们被双引号(" ")包含时，"$*" 会将所有的参数作为一个整体，以"$1 $2 … $n"的形式输出所有参数；"$@" 会将各个参数分开，
# 以"$1" "$2" … "$n" 的形式输出所有参数。

# 转义字符的替换
echo -e "Hello World!\n"

# 命令替换:指Shell可以先执行命令, 将输出结果暂时保存, 在适当的敌方输出.
# 语法: `command`
DATE=`date`
echo "Date is $DATE"
USERS=`who | wc -l`
echo "Logged in user are $USERS"
UP=`date ; uptime`
echo "Uptime is $UP"

# 变量替换
# ${var}	变量本来的值
# ${var:-word}	如果变量 var 为空或已被删除(unset)，那么返回 word，但不改变 var 的值。
# ${var:=word}	如果变量 var 为空或已被删除(unset)，那么返回 word，并将 var 的值设置为 word。
# ${var:?message}	如果变量 var 为空或已被删除(unset)，那么将消息 message 送到标准错误输出，可以用来检测变量 var 是否可以被正常赋值。
# 若此替换出现在Shell脚本中，那么脚本将停止运行。
# ${var:+word}	如果变量 var 被定义，那么返回 word，但不改变 var 的值。

# 算术运算
# 乘号(*)前边必须加反斜杠(\)才能实现乘法运算；
a=10
b=20
val=`expr $a + $b`
echo "a+b=$val"
if [[ $a == $b ]]; then
	echo "a is equal to b"
fi
if [[ $a != $b ]]; then
	echo "a is not equal to b"
fi
# 关系运算符

a=10
b=20
# -eq   检测两个数是否相等，相等返回 true。 [ $a -eq $b ] 返回 true。
# -ne   检测两个数是否相等，不相等返回 true。   [ $a -ne $b ] 返回 true。
# -gt   检测左边的数是否大于右边的，如果是，则返回 true。   [ $a -gt $b ] 返回 false。
# -lt   检测左边的数是否小于右边的，如果是，则返回 true。   [ $a -lt $b ] 返回 true。
# -ge   检测左边的数是否大等于右边的，如果是，则返回 true。  [ $a -ge $b ] 返回 false。
# -le   检测左边的数是否小于等于右边的，如果是，则返回 true。 [ $a -le $b ] 返回 true。
# -a  and
# -o or
# != 检测两个字符串是否相等，不相等返回 true。 [ $a != $b ] 返回 true。
# -z 检测字符串长度是否为0，为0返回 true。  [ -z $a ] 返回 false。
# -n 检测字符串长度是否为0，不为0返回 true。 [ -z $a ] 返回 true。
# str   检测字符串是否为空，不为空返回 true。   [ $a ] 返回 true。
# =
if [ $a -eq $b ] 
then
   echo "$a -eq $b : a is equal to b"
else
   echo "$a -eq $b: a is not equal to b"
fi
# !=
if [ $a -ne $b ]
then
   echo "$a -ne $b: a is not equal to b"
else
   echo "$a -ne $b : a is equal to b"
fi
# >
if [ $a -gt $b ]
then
   echo "$a -gt $b: a is greater than b"
else
   echo "$a -gt $b: a is not greater than b"
fi
# <
if [ $a -lt $b ]
then
   echo "$a -lt $b: a is less than b"
else
   echo "$a -lt $b: a is not less than b"
fi
# >=
if [ $a -ge $b ]
then
   echo "$a -ge $b: a is greater or  equal to b"
else
   echo "$a -ge $b: a is not greater or equal to b"
fi
# <=
if [ $a -le $b ]
then
   echo "$a -le $b: a is less or  equal to b"
else
   echo "$a -le $b: a is not less or equal to b"
fi

# 文件测试运算符

# -b file  检测文件是否是块设备文件，如果是，则返回 true。 [ -b $file ] 返回 false。
# -c file  检测文件是否是字符设备文件，如果是，则返回 true。   [ -b $file ] 返回 false。
# -d file  检测文件是否是目录，如果是，则返回 true。 [ -d $file ] 返回 false。
# -f file  检测文件是否是普通文件（既不是目录，也不是设备文件），如果是，则返回 true。  [ -f $file ] 返回 true。
# -g file  检测文件是否设置了 SGID 位，如果是，则返回 true。   [ -g $file ] 返回 false。
# -k file  检测文件是否设置了粘着位(Sticky Bit)，如果是，则返回 true。 [ -k $file ] 返回 false。
# -p file  检测文件是否是具名管道，如果是，则返回 true。  [ -p $file ] 返回 false。
# -u file  检测文件是否设置了 SUID 位，如果是，则返回 true。   [ -u $file ] 返回 false。
# -r file  检测文件是否可读，如果是，则返回 true。  [ -r $file ] 返回 true。
# -w file  检测文件是否可写，如果是，则返回 true。  [ -w $file ] 返回 true。
# -x file  检测文件是否可执行，如果是，则返回 true。 [ -x $file ] 返回 true。
# -s file  检测文件是否为空（文件大小是否大于0），不为空返回 true。  [ -s $file ] 返回 true。
# -e file  检测文件（包括目录）是否存在，如果是，则返回 true。

file="/Users/ericwang/Desktop/test.sh"

if [ -r $file ]
then
   echo "File has read access"
else
   echo "File does not have read access"
fi

if [ -w $file ]
then
   echo "File has write permission"
else
   echo "File does not have write permission"
fi

if [ -x $file ]
then
   echo "File has execute permission"
else
   echo "File does not have execute permission"
fi

if [ -f $file ]
then
   echo "File is an ordinary file"
else
   echo "This is sepcial file"
fi

if [ -d $file ]
then
   echo "File is a directory"
else
   echo "This is not a directory"
fi

if [ -s $file ]
then
   echo "File size is zero"
else
   echo "File size is not zero"
fi

if [ -e $file ]
then
   echo "File exists"
else
   echo "File does not exist"
fi

# 单引号字符串的限制：
# 单引号里的任何字符都会原样输出，单引号字符串中的变量是无效的；
# 单引号字串中不能出现单引号（对单引号使用转义符后也不行）。
# 双引号的优点：
# 双引号里可以有变量
# 双引号里可以出现转义字符

# 拼接字符串
name="ericwang"
greating="hello, "$name"!"
greating_1="hello, ${name}!"
echo $greating $greating_1

# 获取字符串长度
string="abcde"
echo ${#string}

# 提取字串
string="microsoft is good company"
echo ${string:0:9}

# 查找字串(MAC支持有问题)
# string="alibaba is a great company"
# echo `expr index "$string" is`
# The expr in Linux is generally GNU expr. 
# Mac OS X uses BSD expr which does not have the index command. 
# You could install/compile GNU expr or use this:
# echo string1 | sed -n "s/[string2].*//p" | wc -c
# Note the double quotes in the sed statement otherwise string2 will not be expanded.

# 显示结果重定向
# echo "It is a test" >myfile

# 条件语句
# a=10
# b=20

# if [ $a == $b ]
# then
#    echo "a is equal to b"
# elif [ $a -gt $b ]
# then
#    echo "a is greater than b"
# elif [ $a -lt $b ]
# then
#    echo "a is less than b"
# else
#    echo "None of the condition met"
# fi

# echo 'Input a number between 1 to 4'
# echo 'Your number is:\c'
# read aNum
# case $aNum in
#     1)  echo 'You select 1'
#     ;;
#     2)  echo 'You select 2'
#     ;;
#     3)  echo 'You select 3'
#     ;;
#     4)  echo 'You select 4'
#     ;;
#     *)  echo 'You do not select a number between 1 to 4'
#     ;;
# esac


# option="${1}"
# case ${option} in
#    -f) FILE="${2}"
#       echo "File name is $FILE"
#       ;;
#    -d) DIR="${2}"
#       echo "Dir name is $DIR"
#       ;;
#    *) 
#       echo "`basename ${0}`:usage: [-f file] | [-d directory]"
#       exit 1 # Command to come out of the program with status 1
#       ;;
# esac
# 运行结果：
# $./test.sh
# test.sh: usage: [ -f filename ] | [ -d directory ]
# $ ./test.sh -f index.htm
# $ vi test.sh
# $ ./test.sh -f index.htm
# File name is index.htm
# $ ./test.sh -d unix
# Dir name is unix

# for循环遍历
# for FILE in $HOME/Documents/workspace/youybs-client/proj.*
# do
#    echo $FILE
# done

# while循环
# COUNTER=0
# while [[ $COUNTER -lt 5 ]]; do
#    COUNTER=`expr $COUNTER + 1`
#    echo $COUNTER
# done

# echo 'type <CTRL-D> to terminate'
# echo -n 'enter your most liked film: '
# while read FILM
# do
#     echo "Yeah! great film the $FILM"
# done

# until循环
# a=0

# until [ ! $a -lt 10 ]
# do
#    echo $a
#    a=`expr $a + 1`
# done

# break, continue一样
# while :
# do
#     echo -n "Input a number between 1 to 5: "
#     read aNum
#     case $aNum in
#         1|2|3|4|5) echo "Your number is $aNum!"
#         ;;
#         *) echo "You do not select a number between 1 to 5, game is over!"
#             break
#         ;;
#     esac
# done

# NUMS="1 2 3 4 5 6 7"
# for NUM in $NUMS
# do
#    Q=`expr $NUM % 2`
#    if [ $Q -eq 0 ]
#    then
#       echo "Number is an even number!!"
#       continue
#    fi
#    echo "Found odd number"
# done

# function
# $10 不能获取第十个参数，获取第十个参数需要${10}。当n>=10时，需要使用${n}来获取参数。
# funWithParam(){
#     echo "The value of the first parameter is $1 !"
#     echo "The value of the second parameter is $2 !"
#     echo "The value of the tenth parameter is $10 !"
#     echo "The value of the tenth parameter is ${10} !"
#     echo "The value of the eleventh parameter is ${11} !"
#     echo "The amount of the parameters is $# !"  # 参数个数
#     echo "The string of the parameters is $* !"  # 传递给函数的所有参数
# }
# funWithParam 1 2 3 4 5 6 7 8 9 34 73

# 输出重定向
# 语法: command >file
# 如果不希望覆盖, command >> file

# 一般情况下，每个 Unix/Linux 命令运行时都会打开三个文件：
# 标准输入文件(stdin)：stdin的文件描述符为0，Unix程序默认从stdin读取数据。
# 标准输出文件(stdout)：stdout 的文件描述符为1，Unix程序默认向stdout输出数据。
# 标准错误文件(stderr)：stderr的文件描述符为2，Unix程序会向stderr流中写入错误信息。

# command > file 将输出重定向到 file。
# command < file 将输入重定向到 file。
# command >> file   将输出以追加的方式重定向到 file。
# n > file 将文件描述符为 n 的文件重定向到 file。
# n >> file   将文件描述符为 n 的文件以追加的方式重定向到 file。
# n >& m   将输出文件 m 和 n 合并。
# n <& m   将输入文件 m 和 n 合并。
# << tag   将开始标记 tag 和结束标记 tag 之间的内容作为输入。


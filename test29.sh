方法1：
# awk 'BEGIN{for(n=0;n++<9;){for(i=0;i++<n;)printf i"x"n"="i*n" ";print ""}}'

方法2：

for ((i=1;i<=9;i++)); do
   for ((j=1;j<=i;j++)); do
     result=$(($i*$j))
     echo -n "$j*$i=$result "
   done
   echo
done

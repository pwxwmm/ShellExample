方法1：
# echo $RANDOM |cksum |cut -c 1-8
23648321
方法2：
# openssl rand -base64 4 |cksum |cut -c 1-8       #cksum：打印CRC效验和统计字节
38571131
方法3：
# date +%N |cut -c 1-8     
69024815

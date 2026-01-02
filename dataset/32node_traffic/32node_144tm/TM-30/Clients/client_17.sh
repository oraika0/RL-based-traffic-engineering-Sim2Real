
stdbuf -o0 iperf3 -c 10.0.0.2 -p 17002 -u -b 5374.288k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.7 -p 17007 -u -b 6457.419k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.10 -p 17010 -u -b 3624.277k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.16 -p 17016 -u -b 6608.317k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.18 -p 17018 -u -b 6052.184k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.26 -p 17026 -u -b 1457.596k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.29 -p 17029 -u -b 7272.965k -w 256k -t 80000 -i 0  &
sleep 0.4
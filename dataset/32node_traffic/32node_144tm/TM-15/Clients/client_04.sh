
stdbuf -o0 iperf3 -c 10.0.0.7 -p 4007 -u -b 935.331k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.9 -p 4009 -u -b 57.311k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.16 -p 4016 -u -b 957.188k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.17 -p 4017 -u -b 809.495k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.30 -p 4030 -u -b 428.870k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.32 -p 4032 -u -b 1219.725k -w 256k -t 80000 -i 0  &
sleep 0.4
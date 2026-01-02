
stdbuf -o0 iperf3 -c 10.0.0.4 -p 3004 -u -b 229.611k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.14 -p 3014 -u -b 2966.632k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.16 -p 3016 -u -b 2206.209k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.17 -p 3017 -u -b 1865.794k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.23 -p 3023 -u -b 1339.268k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.28 -p 3028 -u -b 186.803k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.30 -p 3030 -u -b 988.496k -w 256k -t 80000 -i 0  &
sleep 0.4
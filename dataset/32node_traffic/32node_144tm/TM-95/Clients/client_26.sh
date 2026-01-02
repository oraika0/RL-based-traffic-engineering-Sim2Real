
stdbuf -o0 iperf3 -c 10.0.0.2 -p 26002 -u -b 1376.587k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.5 -p 26005 -u -b 2041.804k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.7 -p 26007 -u -b 1654.024k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.15 -p 26015 -u -b 132.820k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.19 -p 26019 -u -b 1254.497k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.23 -p 26023 -u -b 1027.530k -w 256k -t 80000 -i 0  &
sleep 0.4

stdbuf -o0 iperf3 -c 10.0.0.1 -p 19001 -u -b 2603.978k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.4 -p 19004 -u -b 600.041k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.15 -p 19015 -u -b 452.403k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.23 -p 19023 -u -b 3499.903k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.26 -p 19026 -u -b 1271.691k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.30 -p 19030 -u -b 2583.232k -w 256k -t 80000 -i 0  &
sleep 0.4
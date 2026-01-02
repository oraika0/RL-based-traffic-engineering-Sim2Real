
stdbuf -o0 iperf3 -c 10.0.0.1 -p 25001 -u -b 2116.116k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.2 -p 25002 -u -b 3810.372k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.10 -p 25010 -u -b 2569.614k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.12 -p 25012 -u -b 431.207k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.19 -p 25019 -u -b 3472.428k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.23 -p 25023 -u -b 2844.187k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.28 -p 25028 -u -b 396.712k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.30 -p 25030 -u -b 2099.257k -w 256k -t 80000 -i 0  &
sleep 0.4
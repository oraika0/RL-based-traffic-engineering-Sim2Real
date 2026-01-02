
stdbuf -o0 iperf3 -c 10.0.0.1 -p 20001 -u -b 1382.807k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.4 -p 20004 -u -b 318.644k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.9 -p 20009 -u -b 183.315k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.11 -p 20011 -u -b 4437.912k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.25 -p 20025 -u -b 1963.868k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.31 -p 20031 -u -b 932.808k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.32 -p 20032 -u -b 3901.434k -w 256k -t 80000 -i 0  &
sleep 0.4
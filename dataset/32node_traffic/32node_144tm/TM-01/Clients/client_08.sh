
stdbuf -o0 iperf3 -c 10.0.0.1 -p 8001 -u -b 9390.654k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.2 -p 8002 -u -b 5064.588k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.4 -p 8004 -u -b 648.127k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.12 -p 8012 -u -b 7253.000k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.14 -p 8014 -u -b 15830.966k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.15 -p 8015 -u -b 5131.000k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.20 -p 8020 -u -b 2701.196k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.27 -p 8027 -u -b 1440.444k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.31 -p 8031 -u -b 1897.348k -w 256k -t 80000 -i 0  &
sleep 0.4

stdbuf -o0 iperf3 -c 10.0.0.2 -p 23002 -u -b 3788.596k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.7 -p 23007 -u -b 4552.148k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.21 -p 23021 -u -b 2125.878k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.25 -p 23025 -u -b 2988.142k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.31 -p 23031 -u -b 1419.323k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.32 -p 23032 -u -b 5936.263k -w 256k -t 80000 -i 0  &
sleep 0.4
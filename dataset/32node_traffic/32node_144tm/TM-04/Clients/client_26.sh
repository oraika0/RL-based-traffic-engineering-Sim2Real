
stdbuf -o0 iperf3 -c 10.0.0.3 -p 26003 -u -b 497.111k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.8 -p 26008 -u -b 1494.034k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.11 -p 26011 -u -b 2454.613k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.12 -p 26012 -u -b 155.852k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.15 -p 26015 -u -b 132.878k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.17 -p 26017 -u -b 1432.125k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.24 -p 26024 -u -b 2047.150k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.32 -p 26032 -u -b 2157.886k -w 256k -t 80000 -i 0  &
sleep 0.4
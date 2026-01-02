
stdbuf -o0 iperf3 -c 10.0.0.4 -p 3004 -u -b 7205.000k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.5 -p 3005 -u -b 3256.727k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.6 -p 3006 -u -b 6946.000k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.16 -p 3016 -u -b 2699.858k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.17 -p 3017 -u -b 2283.274k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.32 -p 3032 -u -b 3440.375k -w 256k -t 80000 -i 0  &
sleep 0.4
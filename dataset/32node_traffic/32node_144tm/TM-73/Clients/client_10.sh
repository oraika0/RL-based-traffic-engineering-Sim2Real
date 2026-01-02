
stdbuf -o0 iperf3 -c 10.0.0.12 -p 10012 -u -b 6995.284k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.13 -p 10013 -u -b 10215.920k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.15 -p 10015 -u -b 6076.000k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.22 -p 10022 -u -b 3331.795k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.23 -p 10023 -u -b 2350.005k -w 256k -t 80000 -i 0  &
sleep 0.4
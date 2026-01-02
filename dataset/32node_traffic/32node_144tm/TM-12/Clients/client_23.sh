
stdbuf -o0 iperf3 -c 10.0.0.6 -p 23006 -u -b 4149.493k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.12 -p 23012 -u -b 379.616k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.15 -p 23015 -u -b 323.658k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.22 -p 23022 -u -b 3549.990k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.32 -p 23032 -u -b 5256.076k -w 256k -t 80000 -i 0  &
sleep 0.4
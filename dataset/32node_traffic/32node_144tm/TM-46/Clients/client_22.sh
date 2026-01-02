
stdbuf -o0 iperf3 -c 10.0.0.1 -p 22001 -u -b 3301.555k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.2 -p 22002 -u -b 5944.925k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.7 -p 22007 -u -b 7143.061k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.12 -p 22012 -u -b 672.767k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.13 -p 22013 -u -b 9681.103k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.16 -p 22016 -u -b 7309.982k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.17 -p 22017 -u -b 6182.062k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.29 -p 22029 -u -b 8045.201k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.32 -p 22032 -u -b 9314.963k -w 256k -t 80000 -i 0  &
sleep 0.4
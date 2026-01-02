
stdbuf -o0 iperf3 -c 10.0.0.9 -p 29009 -u -b 447.749k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.13 -p 29013 -u -b 9903.875k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.15 -p 29015 -u -b 586.795k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.18 -p 29018 -u -b 6848.852k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.23 -p 29023 -u -b 4539.598k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.32 -p 29032 -u -b 9529.309k -w 256k -t 80000 -i 0  &
sleep 0.4

stdbuf -o0 iperf3 -c 10.0.0.5 -p 26005 -u -b 2590.673k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.12 -p 26012 -u -b 197.661k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.13 -p 26013 -u -b 2844.336k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.15 -p 26015 -u -b 168.524k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.24 -p 26024 -u -b 2596.320k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.27 -p 26027 -u -b 496.769k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.29 -p 26029 -u -b 2363.703k -w 256k -t 80000 -i 0  &
sleep 0.4
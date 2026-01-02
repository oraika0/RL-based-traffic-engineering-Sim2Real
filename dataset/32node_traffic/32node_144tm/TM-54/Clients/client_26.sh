
stdbuf -o0 iperf3 -c 10.0.0.1 -p 26001 -u -b 778.435k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.3 -p 26003 -u -b 505.952k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.6 -p 26006 -u -b 1733.877k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.15 -p 26015 -u -b 135.242k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.16 -p 26016 -u -b 1723.535k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.20 -p 26020 -u -b 747.587k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.24 -p 26024 -u -b 2083.560k -w 256k -t 80000 -i 0  &
sleep 0.4
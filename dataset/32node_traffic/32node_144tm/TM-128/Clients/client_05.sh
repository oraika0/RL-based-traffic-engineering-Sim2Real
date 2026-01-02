
stdbuf -o0 iperf3 -c 10.0.0.2 -p 5002 -u -b 5404.000k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.7 -p 5007 -u -b 5465.000k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.13 -p 5013 -u -b 12264.967k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.15 -p 5015 -u -b 726.688k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.19 -p 5019 -u -b 6863.627k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.26 -p 5026 -u -b 2042.698k -w 256k -t 80000 -i 0  &
sleep 0.4
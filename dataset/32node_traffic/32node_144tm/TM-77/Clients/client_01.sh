
stdbuf -o0 iperf3 -c 10.0.0.3 -p 1003 -u -b 6197.000k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.11 -p 1011 -u -b 7423.000k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.12 -p 1012 -u -b 323.363k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.13 -p 1013 -u -b 4653.183k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.26 -p 1026 -u -b 774.975k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.28 -p 1028 -u -b 297.495k -w 256k -t 80000 -i 0  &
sleep 0.4
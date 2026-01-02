
stdbuf -o0 iperf3 -c 10.0.0.10 -p 19010 -u -b 4095.742k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.11 -p 19011 -u -b 10824.839k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.12 -p 19012 -u -b 687.306k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.24 -p 19024 -u -b 9027.926k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.26 -p 19026 -u -b 1647.208k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.31 -p 19031 -u -b 2275.281k -w 256k -t 80000 -i 0  &
sleep 0.4
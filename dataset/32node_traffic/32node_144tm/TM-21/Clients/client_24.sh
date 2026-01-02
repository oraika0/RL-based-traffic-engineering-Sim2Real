
stdbuf -o0 iperf3 -c 10.0.0.1 -p 24001 -u -b 5021.569k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.9 -p 24009 -u -b 665.695k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.10 -p 24010 -u -b 6097.724k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.17 -p 24017 -u -b 9402.738k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.22 -p 24022 -u -b 9569.022k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.23 -p 24023 -u -b 6749.291k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.25 -p 24025 -u -b 7131.653k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.27 -p 24027 -u -b 2571.695k -w 256k -t 80000 -i 0  &
sleep 0.4
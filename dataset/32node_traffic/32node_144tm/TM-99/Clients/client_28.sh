
stdbuf -o0 iperf3 -c 10.0.0.3 -p 28003 -u -b 186.803k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.6 -p 28006 -u -b 640.167k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.10 -p 28010 -u -b 349.000k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.11 -p 28011 -u -b 922.389k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.12 -p 28012 -u -b 58.566k -w 256k -t 80000 -i 0  &
sleep 0.4
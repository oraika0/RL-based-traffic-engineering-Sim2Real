
stdbuf -o0 iperf3 -c 10.0.0.4 -p 17004 -u -b 684.703k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.5 -p 17005 -u -b 7935.910k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.21 -p 17021 -u -b 3002.247k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.24 -p 17024 -u -b 7953.207k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.26 -p 17026 -u -b 1451.118k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.30 -p 17030 -u -b 2947.709k -w 256k -t 80000 -i 0  &
sleep 0.4
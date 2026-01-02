
stdbuf -o0 iperf3 -c 10.0.0.1 -p 29001 -u -b 3735.768k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.9 -p 29009 -u -b 495.240k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.10 -p 29010 -u -b 4536.366k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.17 -p 29017 -u -b 6995.112k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.21 -p 29021 -u -b 3774.571k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.28 -p 29028 -u -b 700.351k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.31 -p 29031 -u -b 2520.058k -w 256k -t 80000 -i 0  &
sleep 0.4
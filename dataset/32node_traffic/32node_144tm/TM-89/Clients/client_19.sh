
stdbuf -o0 iperf3 -c 10.0.0.9 -p 19009 -u -b 447.137k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.16 -p 19016 -u -b 7467.962k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.17 -p 19017 -u -b 6315.667k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.21 -p 19021 -u -b 3407.941k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.24 -p 19024 -u -b 9027.926k -w 256k -t 80000 -i 0  &
sleep 0.4
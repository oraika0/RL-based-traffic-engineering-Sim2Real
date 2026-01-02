
stdbuf -o0 iperf3 -c 10.0.0.4 -p 16004 -u -b 883.958k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.5 -p 16005 -u -b 10245.340k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.7 -p 16007 -u -b 8299.541k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.12 -p 16012 -u -b 781.689k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.19 -p 16019 -u -b 6294.799k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.23 -p 16023 -u -b 5155.928k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.32 -p 16032 -u -b 10823.079k -w 256k -t 80000 -i 0  &
sleep 0.4
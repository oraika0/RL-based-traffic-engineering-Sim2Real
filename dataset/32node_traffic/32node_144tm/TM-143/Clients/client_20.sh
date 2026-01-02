
stdbuf -o0 iperf3 -c 10.0.0.4 -p 20004 -u -b 346.430k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.13 -p 20013 -u -b 4408.369k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.18 -p 20018 -u -b 3048.531k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.21 -p 20021 -u -b 1519.006k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.23 -p 20023 -u -b 2020.646k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.27 -p 20027 -u -b 769.930k -w 256k -t 80000 -i 0  &
sleep 0.4
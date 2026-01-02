
stdbuf -o0 iperf3 -c 10.0.0.3 -p 16003 -u -b 2858.351k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.7 -p 16007 -u -b 9514.678k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.17 -p 16017 -u -b 8234.611k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.20 -p 16020 -u -b 4223.456k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.26 -p 16026 -u -b 2147.694k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.28 -p 16028 -u -b 824.449k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.30 -p 16030 -u -b 4362.689k -w 256k -t 80000 -i 0  &
sleep 0.4
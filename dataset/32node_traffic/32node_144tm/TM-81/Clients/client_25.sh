
stdbuf -o0 iperf3 -c 10.0.0.1 -p 25001 -u -b 2177.269k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.10 -p 25010 -u -b 2643.872k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.12 -p 25012 -u -b 443.668k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.14 -p 25014 -u -b 6482.269k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.17 -p 25017 -u -b 4076.871k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.24 -p 25024 -u -b 5827.682k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.27 -p 25027 -u -b 1115.044k -w 256k -t 80000 -i 0  &
sleep 0.4
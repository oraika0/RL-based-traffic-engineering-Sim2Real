
stdbuf -o0 iperf3 -c 10.0.0.2 -p 29002 -u -b 8715.186k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.7 -p 29007 -u -b 10471.640k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.21 -p 29021 -u -b 4890.313k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.22 -p 29022 -u -b 9223.100k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.32 -p 29032 -u -b 13655.621k -w 256k -t 80000 -i 0  &
sleep 0.4
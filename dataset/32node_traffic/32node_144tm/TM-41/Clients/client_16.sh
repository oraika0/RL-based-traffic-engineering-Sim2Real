
stdbuf -o0 iperf3 -c 10.0.0.3 -p 16003 -u -b 2957.984k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.6 -p 16006 -u -b 10136.885k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.8 -p 16008 -u -b 8890.023k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.19 -p 16019 -u -b 7467.962k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.24 -p 16024 -u -b 12181.258k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.31 -p 16031 -u -b 3070.006k -w 256k -t 80000 -i 0  &
sleep 0.4

stdbuf -o0 iperf3 -c 10.0.0.2 -p 29002 -u -b 7602.154k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.3 -p 29003 -u -b 2744.076k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.9 -p 29009 -u -b 559.687k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.10 -p 29010 -u -b 5126.690k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.13 -p 29013 -u -b 12379.843k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.19 -p 29019 -u -b 6927.913k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.28 -p 29028 -u -b 791.488k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.30 -p 29030 -u -b 4188.272k -w 256k -t 80000 -i 0  &
sleep 0.4
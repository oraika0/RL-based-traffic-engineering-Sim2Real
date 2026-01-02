
stdbuf -o0 iperf3 -c 10.0.0.1 -p 16001 -u -b 4153.877k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.10 -p 16010 -u -b 5044.079k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.14 -p 16014 -u -b 12367.117k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.15 -p 16015 -u -b 721.674k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.26 -p 16026 -u -b 2028.606k -w 256k -t 80000 -i 0  &
sleep 0.4
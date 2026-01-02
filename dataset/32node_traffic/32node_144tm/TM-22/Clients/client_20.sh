
stdbuf -o0 iperf3 -c 10.0.0.1 -p 20001 -u -b 1663.911k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.8 -p 20008 -u -b 3250.308k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.10 -p 20010 -u -b 2020.498k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.19 -p 20019 -u -b 2730.384k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.29 -p 20029 -u -b 4054.605k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.31 -p 20031 -u -b 1122.434k -w 256k -t 80000 -i 0  &
sleep 0.4

stdbuf -o0 iperf3 -c 10.0.0.5 -p 18005 -u -b 10756.911k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.11 -p 18011 -u -b 12926.071k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.13 -p 18013 -u -b 11810.160k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.14 -p 18014 -u -b 11991.246k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.20 -p 18020 -u -b 3868.024k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.27 -p 18027 -u -b 2062.668k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.29 -p 18029 -u -b 9814.492k -w 256k -t 80000 -i 0  &
sleep 0.4
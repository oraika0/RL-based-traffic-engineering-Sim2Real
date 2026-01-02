
stdbuf -o0 iperf3 -c 10.0.0.1 -p 28001 -u -b 385.342k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.5 -p 28005 -u -b 1029.164k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.17 -p 28017 -u -b 721.541k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.22 -p 28022 -u -b 734.302k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.31 -p 28031 -u -b 259.942k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.32 -p 28032 -u -b 1087.199k -w 256k -t 80000 -i 0  &
sleep 0.4
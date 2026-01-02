
stdbuf -o0 iperf3 -c 10.0.0.1 -p 27001 -u -b 960.806k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.10 -p 27010 -u -b 1166.713k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.12 -p 27012 -u -b 195.786k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.14 -p 27014 -u -b 2860.557k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.19 -p 27019 -u -b 1576.629k -w 256k -t 80000 -i 0  &
sleep 0.4
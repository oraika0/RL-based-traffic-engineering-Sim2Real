
stdbuf -o0 iperf3 -c 10.0.0.3 -p 17003 -u -b 1752.363k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.8 -p 17008 -u -b 5266.610k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.11 -p 17011 -u -b 8652.744k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.16 -p 17016 -u -b 5969.453k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.18 -p 17018 -u -b 5467.084k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.20 -p 17020 -u -b 2589.265k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.25 -p 17025 -u -b 3829.019k -w 256k -t 80000 -i 0  &
sleep 0.4
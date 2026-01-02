
stdbuf -o0 iperf3 -c 10.0.0.9 -p 26009 -u -b 101.392k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.17 -p 26017 -u -b 1432.125k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.21 -p 26021 -u -b 772.776k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.22 -p 26022 -u -b 1457.451k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.25 -p 26025 -u -b 1086.217k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.28 -p 26028 -u -b 143.384k -w 256k -t 80000 -i 0  &
sleep 0.4
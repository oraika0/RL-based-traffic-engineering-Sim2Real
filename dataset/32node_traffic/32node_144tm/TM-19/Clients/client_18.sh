
stdbuf -o0 iperf3 -c 10.0.0.1 -p 18001 -u -b 4168.019k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.4 -p 18004 -u -b 960.447k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.8 -p 18008 -u -b 8141.869k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.23 -p 18023 -u -b 5602.067k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.24 -p 18024 -u -b 11156.125k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.28 -p 18028 -u -b 781.386k -w 256k -t 80000 -i 0  &
sleep 0.4
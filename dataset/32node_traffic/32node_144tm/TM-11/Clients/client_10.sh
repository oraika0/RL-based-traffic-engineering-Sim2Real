
stdbuf -o0 iperf3 -c 10.0.0.7 -p 10007 -u -b 6445.000k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.17 -p 10017 -u -b 3273.897k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.19 -p 10019 -u -b 2869.088k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.25 -p 10025 -u -b 2483.138k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.27 -p 10027 -u -b 895.427k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.30 -p 10030 -u -b 1734.508k -w 256k -t 80000 -i 0  &
sleep 0.4
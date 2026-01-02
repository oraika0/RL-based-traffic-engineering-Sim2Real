
stdbuf -o0 iperf3 -c 10.0.0.4 -p 16004 -u -b 883.958k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.7 -p 16007 -u -b 8299.541k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.9 -p 16009 -u -b 508.539k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.13 -p 16013 -u -b 11248.499k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.21 -p 16021 -u -b 3875.931k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.24 -p 16024 -u -b 10267.670k -w 256k -t 80000 -i 0  &
sleep 0.4

stdbuf -o0 iperf3 -c 10.0.0.15 -p 26015 -u -b 174.398k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.16 -p 26016 -u -b 2222.555k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.17 -p 26017 -u -b 1879.618k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.29 -p 26029 -u -b 2446.094k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.30 -p 26030 -u -b 995.820k -w 256k -t 80000 -i 0  &
sleep 0.4
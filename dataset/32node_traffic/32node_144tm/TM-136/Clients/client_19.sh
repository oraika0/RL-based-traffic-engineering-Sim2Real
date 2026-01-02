
stdbuf -o0 iperf3 -c 10.0.0.13 -p 19013 -u -b 9557.195k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.21 -p 19021 -u -b 3293.153k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.29 -p 19029 -u -b 7942.230k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.32 -p 19032 -u -b 9195.740k -w 256k -t 80000 -i 0  &
sleep 0.4
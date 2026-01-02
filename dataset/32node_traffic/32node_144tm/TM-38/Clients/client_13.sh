
stdbuf -o0 iperf3 -c 10.0.0.12 -p 13012 -u -b 1035.244k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.19 -p 13019 -u -b 8336.628k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.25 -p 13025 -u -b 7215.185k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.26 -p 13026 -u -b 2481.080k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.28 -p 13028 -u -b 952.429k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.29 -p 13029 -u -b 12379.843k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.30 -p 13030 -u -b 5039.910k -w 256k -t 80000 -i 0  &
sleep 0.4
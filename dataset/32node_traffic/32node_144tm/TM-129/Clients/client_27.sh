
stdbuf -o0 iperf3 -c 10.0.0.3 -p 27003 -u -b 510.304k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.4 -p 27004 -u -b 180.919k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.7 -p 27007 -u -b 1698.663k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.13 -p 27013 -u -b 2302.225k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.23 -p 27023 -u -b 1055.261k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.24 -p 27024 -u -b 2101.479k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.28 -p 27028 -u -b 147.190k -w 256k -t 80000 -i 0  &
sleep 0.4
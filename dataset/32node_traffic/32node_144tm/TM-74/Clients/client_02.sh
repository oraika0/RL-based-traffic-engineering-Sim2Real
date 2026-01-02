
stdbuf -o0 iperf3 -c 10.0.0.4 -p 2004 -u -b 618.244k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.6 -p 2006 -u -b 7269.000k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.11 -p 2011 -u -b 8610.608k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.12 -p 2012 -u -b 546.717k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.21 -p 2021 -u -b 2710.844k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.27 -p 2027 -u -b 1374.031k -w 256k -t 80000 -i 0  &
sleep 0.4
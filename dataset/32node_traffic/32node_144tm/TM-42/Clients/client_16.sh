
stdbuf -o0 iperf3 -c 10.0.0.5 -p 16005 -u -b 12294.408k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.6 -p 16006 -u -b 10253.343k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.9 -p 16009 -u -b 610.247k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.15 -p 16015 -u -b 799.755k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.21 -p 16021 -u -b 4651.117k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.30 -p 16030 -u -b 4566.627k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.32 -p 16032 -u -b 12987.695k -w 256k -t 80000 -i 0  &
sleep 0.4
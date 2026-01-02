
stdbuf -o0 iperf3 -c 10.0.0.3 -p 25003 -u -b 1897.356k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.5 -p 25005 -u -b 7796.498k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.10 -p 25010 -u -b 3544.783k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.11 -p 25011 -u -b 9368.682k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.12 -p 25012 -u -b 594.850k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.26 -p 25026 -u -b 1425.626k -w 256k -t 80000 -i 0  &
sleep 0.4
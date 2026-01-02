
stdbuf -o0 iperf3 -c 10.0.0.2 -p 32002 -u -b 10090.691k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.4 -p 32004 -u -b 1291.328k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.18 -p 32018 -u -b 11363.498k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.27 -p 32027 -u -b 2869.941k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.29 -p 32029 -u -b 13655.621k -w 256k -t 80000 -i 0  &
sleep 0.4
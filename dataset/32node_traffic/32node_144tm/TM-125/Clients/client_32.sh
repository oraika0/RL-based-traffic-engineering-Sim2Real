
stdbuf -o0 iperf3 -c 10.0.0.8 -p 32008 -u -b 8745.825k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.9 -p 32009 -u -b 593.530k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.23 -p 32023 -u -b 6017.623k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.28 -p 32028 -u -b 839.348k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.30 -p 32030 -u -b 4441.528k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.31 -p 32031 -u -b 3020.210k -w 256k -t 80000 -i 0  &
sleep 0.4
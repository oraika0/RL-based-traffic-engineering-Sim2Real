
stdbuf -o0 iperf3 -c 10.0.0.1 -p 20001 -u -b 1907.525k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.3 -p 20003 -u -b 1239.817k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.14 -p 20014 -u -b 5679.172k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.22 -p 20022 -u -b 3634.948k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.30 -p 20030 -u -b 1892.327k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.32 -p 20032 -u -b 5381.865k -w 256k -t 80000 -i 0  &
sleep 0.4
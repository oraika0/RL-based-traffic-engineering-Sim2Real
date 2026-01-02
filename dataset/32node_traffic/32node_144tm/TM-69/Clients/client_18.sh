
stdbuf -o0 iperf3 -c 10.0.0.8 -p 18008 -u -b 7431.375k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.10 -p 18010 -u -b 4619.586k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.20 -p 18020 -u -b 3653.545k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.27 -p 18027 -u -b 1948.295k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.31 -p 18031 -u -b 2566.289k -w 256k -t 80000 -i 0  &
sleep 0.4

stdbuf -o0 iperf3 -c 10.0.0.9 -p 20009 -u -b 195.181k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.11 -p 20011 -u -b 4725.179k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.15 -p 20015 -u -b 255.793k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.19 -p 20019 -u -b 2415.988k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.22 -p 20022 -u -b 2805.623k -w 256k -t 80000 -i 0  &
sleep 0.4
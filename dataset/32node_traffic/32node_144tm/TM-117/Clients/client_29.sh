
stdbuf -o0 iperf3 -c 10.0.0.10 -p 29010 -u -b 5551.399k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.14 -p 29014 -u -b 13610.970k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.18 -p 29018 -u -b 9270.287k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.19 -p 29019 -u -b 7501.840k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.26 -p 29026 -u -b 2232.638k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.28 -p 29028 -u -b 857.057k -w 256k -t 80000 -i 0  &
sleep 0.4
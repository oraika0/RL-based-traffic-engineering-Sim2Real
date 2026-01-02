
stdbuf -o0 iperf3 -c 10.0.0.9 -p 20009 -u -b 238.854k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.11 -p 20011 -u -b 5782.460k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.15 -p 20015 -u -b 313.028k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.19 -p 20019 -u -b 2956.577k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.21 -p 20021 -u -b 1820.469k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.30 -p 20030 -u -b 1787.399k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.31 -p 20031 -u -b 1215.420k -w 256k -t 80000 -i 0  &
sleep 0.4
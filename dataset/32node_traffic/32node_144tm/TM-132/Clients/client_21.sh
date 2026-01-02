
stdbuf -o0 iperf3 -c 10.0.0.6 -p 21006 -u -b 3119.351k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.7 -p 21007 -u -b 3029.940k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.16 -p 21016 -u -b 3100.745k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.17 -p 21017 -u -b 2622.304k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.23 -p 21023 -u -b 1882.291k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.25 -p 21025 -u -b 1988.927k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.26 -p 21026 -u -b 683.931k -w 256k -t 80000 -i 0  &
sleep 0.4
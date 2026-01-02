
stdbuf -o0 iperf3 -c 10.0.0.1 -p 16001 -u -b 3467.526k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.2 -p 16002 -u -b 6243.779k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.6 -p 16006 -u -b 7723.527k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.9 -p 16009 -u -b 459.680k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.18 -p 16018 -u -b 7031.349k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.22 -p 16022 -u -b 6607.661k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.24 -p 16024 -u -b 9281.183k -w 256k -t 80000 -i 0  &
sleep 0.4
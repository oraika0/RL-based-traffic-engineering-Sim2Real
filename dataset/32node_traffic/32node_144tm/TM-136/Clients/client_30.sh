
stdbuf -o0 iperf3 -c 10.0.0.1 -p 30001 -u -b 1970.409k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.7 -p 30007 -u -b 4263.069k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.8 -p 30008 -u -b 3849.027k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.9 -p 30009 -u -b 261.212k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.11 -p 30011 -u -b 6323.734k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.14 -p 30014 -u -b 5866.396k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.15 -p 30015 -u -b 342.329k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.19 -p 30019 -u -b 3233.331k -w 256k -t 80000 -i 0  &
sleep 0.4
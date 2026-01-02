
stdbuf -o0 iperf3 -c 10.0.0.3 -p 24003 -u -b 2667.058k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.8 -p 24008 -u -b 8015.665k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.16 -p 24016 -u -b 9085.376k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.26 -p 24026 -u -b 2003.961k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.27 -p 24027 -u -b 2101.479k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.30 -p 24030 -u -b 4070.719k -w 256k -t 80000 -i 0  &
sleep 0.4
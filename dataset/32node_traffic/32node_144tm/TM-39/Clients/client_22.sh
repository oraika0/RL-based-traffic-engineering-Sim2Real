
stdbuf -o0 iperf3 -c 10.0.0.7 -p 22007 -u -b 7734.812k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.15 -p 22015 -u -b 621.114k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.20 -p 22020 -u -b 3433.394k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.26 -p 22026 -u -b 1745.935k -w 256k -t 80000 -i 0  &
sleep 0.4
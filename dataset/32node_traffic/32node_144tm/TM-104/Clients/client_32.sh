
stdbuf -o0 iperf3 -c 10.0.0.4 -p 32004 -u -b 1018.188k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.5 -p 32005 -u -b 11801.104k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.6 -p 32006 -u -b 9841.936k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.9 -p 32009 -u -b 585.761k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.11 -p 32011 -u -b 14180.829k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.23 -p 32023 -u -b 5938.861k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.24 -p 32024 -u -b 11826.825k -w 256k -t 80000 -i 0  &
sleep 0.4
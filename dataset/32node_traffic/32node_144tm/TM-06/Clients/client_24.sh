
stdbuf -o0 iperf3 -c 10.0.0.2 -p 24002 -u -b 7682.274k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.3 -p 24003 -u -b 2772.996k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.25 -p 24025 -u -b 6059.163k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.27 -p 24027 -u -b 2184.952k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.28 -p 24028 -u -b 799.830k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.32 -p 24032 -u -b 12037.174k -w 256k -t 80000 -i 0  &
sleep 0.4
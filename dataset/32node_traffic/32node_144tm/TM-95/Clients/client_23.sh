
stdbuf -o0 iperf3 -c 10.0.0.2 -p 23002 -u -b 3788.596k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.8 -p 23008 -u -b 4110.029k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.24 -p 23024 -u -b 5631.631k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.25 -p 23025 -u -b 2988.142k -w 256k -t 80000 -i 0  &
sleep 0.4
stdbuf -o0 iperf3 -c 10.0.0.28 -p 23028 -u -b 394.445k -w 256k -t 80000 -i 0  &
sleep 0.4
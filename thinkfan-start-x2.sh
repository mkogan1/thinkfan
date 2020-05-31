set -x
pgrep -a thinkfan
sudo pkill -HUP thinkfan ; sleep 10
sudo pkill thinkfan ; sleep 4
sudo pkill -9 thinkfan ; sleep 1
sudo rm -f /run/thinkfan.pid
sudo unbuffer thinkfan -D -n -v -b0 -c ./thinkfan1.conf > /tmp/thinkfan1.log &
disown
sleep 1
sudo rm -f /run/thinkfan.pid
sudo unbuffer thinkfan -D -n -v -b0 -c ./thinkfan2.conf > /tmp/thinkfan2.log &
disown
sleep 1
pgrep -a thinkfan
tail -f /tmp/thinkfan1.log -f /tmp/thinkfan2.log | ccze -Aonolookups


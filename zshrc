# start sway if running from tty1
if [[ ${tty} = "/dev/tty1" ]]
then
    exec sway
fi
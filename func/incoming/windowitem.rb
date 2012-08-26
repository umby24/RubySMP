$socket.gets(1)
count = $socket.gets(2)
count = count.unpack("n")[0].to_i
for i in 1..count
do_slotdata()
end
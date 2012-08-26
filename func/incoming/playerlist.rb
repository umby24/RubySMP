length = $socket.gets(2)
length = length.unpack("n")[0].to_i
mystring = unpackstring($socket.gets(length * 2))
online = get_bytes($socket.gets(1))[0].to_i
$socket.gets(2)
if online == 0
$players.delete(mystring)
else
$players += [mystring]
end
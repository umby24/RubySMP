$socket.gets(4) #Eid
length = $socket.gets(2)
length = length.unpack("n")[0].to_i
mystring = unpackstring($socket.gets(length * 2))
$socket.gets(16)
#packet done
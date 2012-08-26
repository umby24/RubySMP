$socket.gets(13) #Clear out what we don't need..
chunksize = $socket.gets(4)
chunksize = chunksize.unpack("N")[0].to_i
$socket.gets(4) #unused INT
$socket.gets(chunksize) #The chunk!
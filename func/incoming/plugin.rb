length = $socket.gets(2)
length = length.unpack("n")[0].to_i
channel = unpackstring($socket.gets(length * 2))
puts "Plugin Message: " + channel
length = $socket.gets(2)
length = length.unpack("n")[0].to_i
$socket.gets(length)
#Packet Handled.

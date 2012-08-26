#Chat Message
#I'm going to make a nice plugin system for this later.. but for now?
#I just want a bot that sits and does nothing :D
length = $socket.gets(2)
length = length.unpack("n")[0].to_i
mystring = unpackstring($socket.gets(length * 2))
puts cleanchat(mystring)
#Packet Handled.
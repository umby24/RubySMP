length = get_bytes($socket.gets(2))
length = array_2_string(length)
length = length.unpack('n')
length = length[0].to_i
puts "String length: " + length.to_s
mystring = get_bytes($socket.gets(length * 2))
mystring = array_2_string(mystring)
mystring = unpackstring(mystring)
puts "Kicked! Reason: " + mystring


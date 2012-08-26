mystring = "#{$username};#{$serverip};#{$serverport}"
#Format to UCS-2
mystring = get_string(mystring)
id = 2.chr
id = get_bytes(id)
packet = mystring
#packet = get_bytes(mystring)
packet = id + packet
packet = array_2_string(packet)
$socket.send(packet, 0)

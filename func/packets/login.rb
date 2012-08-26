mypacket = [1]
version = 29 #1.2.5: 29
version = get_int_bytes(version)
mypacket += version
mypacket += get_string($username)
13.times {mypacket += [0]}
mypacket = array_2_string(mypacket)
$socket.send(mypacket,0) # add 13 blank bytes..
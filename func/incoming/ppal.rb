#Receiving
packet = 13.chr
x = $socket.gets(8)
packet += x
x = x.unpack("G")[0]
stance = $socket.gets(8)
stance2 = stance
stance = stance.unpack("G")[0]
y = $socket.gets(8)
packet += y
packet += stance2
y = y.unpack("G")[0]
z = $socket.gets(8)
packet += z
z = z.unpack("G")[0]
yaw = $socket.gets(4)
packet += yaw
yaw = yaw.unpack("g")[0]
pitch = $socket.gets(4)
packet += pitch
pitch = pitch.unpack("g")[0]
onground = $socket.gets(1)
packet += onground
onground = get_signedbyte(onground)[0].to_i
$location = {"x"=>x,"y"=>y,"z"=>z,"stance"=>stance,"pitch"=>pitch,"yaw"=>yaw,"onground"=>onground}
#make(13)
$socket.send(packet,0)
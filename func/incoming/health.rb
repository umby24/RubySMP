health = $socket.gets(2)
health = health.unpack("n")[0].to_i
food = $socket.gets(2)
food = food.unpack("n")[0].to_i
saturation = $socket.gets(4)
saturation = saturation.unpack("g")[0]
$health = health; $food = food; $saturation = saturation;
puts "Health: " + $health.to_s
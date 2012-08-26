spawnx = $socket.gets(4)
spawnx = spawnx.unpack("N")[0].to_i
spawny = $socket.gets(4)
spawny = spawny.unpack("N")[0].to_i
spawnz = $socket.gets(4)
spawnz = spawnz.unpack("N")[0].to_i
$spawn = ["x"=>spawnx,"y"=>spawny,"z"=>spawnz]
puts $spawn
#handled.
#Sending - will pull from our hash
packet = 13.chr
packet += [$location.fetch("x")].pack("G")
packet += [$location.fetch("y")].pack("G")
packet += [$location.fetch("stance")].pack("G")
packet += [$location["z"]].pack("G")
packet += [$location["yaw"]].pack("g")
packet += [$location["pitch"]].pack("g")
packet += $location["onground"].to_s
$socket.send(packet,0)
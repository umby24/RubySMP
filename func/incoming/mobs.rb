#50 = creeper, #55 = slime
$socket.gets(4) #EID
type = get_bytes($socket.gets(1))[0].to_i
if type == 50
puts "SPAWNED CREEPER!!"
end
if type == "55"
puts "SPAWNED SLIME!!"
end
$socket.gets(15) #x,y,z, yaw, pitch, headyaw
#Moment of truth..
fuck_metadata()
#done!
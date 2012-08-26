# encoding: UTF-8
#Function that funnels in all the external packet files to create and parse packets#

def make(packetid)
case (packetid)
when 1
load 'func/packets/login.rb'
when 2
load 'func/packets/handshake.rb'
when 13
load 'func/packets/ppal.rb'
  else
  puts packetid

 
end
end

def handle(packetid)
 case (packetid)
 when 0
 load 'func/incoming/ping.rb'
 when 1
 load 'func/incoming/login.rb'
 when 2
 load 'func/incoming/handshake.rb'
 when 3
 load 'func/incoming/chat.rb'
 when 4
 load 'func/incoming/time.rb'
 when 5
 load 'func/incoming/enteq.rb'
 when 6
 load 'func/incoming/spawn.rb'
 when 8
 load 'func/incoming/health.rb'
 when 9
 load 'func/incoming/respawn.rb'
 when 13
 load 'func/incoming/ppal.rb'
 when 21
 load 'func/incoming/spawnitem.rb'
 when 24
 load 'func/incoming/mobs.rb'
 when 25
 load 'func/incoming/painting.rb'
 when 26
 load 'func/incming/xporb.rb'
 when 28
 load 'func/incoming/velocity.rb'
 when 29
 load 'func/incoming/destoryent.rb'
 when 30
 load 'func/incoming/entity.rb'
 when 35
 load 'func/incoming/enthead.rb'
 when 50
 load 'func/incoming/prechunk.rb'
 when 51
 load 'func/incoming/chunk.rb'
 when 70
 load 'func/incoming/state.rb'
 when 104
 load 'func/incoming/windowitem.rb'
 when 201
 load 'func/incoming/playerlist.rb'
 when 202
 load 'func/incoming/ability.rb'
 when 250
 load 'func/incoming/plugin.rb'
 when 255
 load 'func/incoming/kick.rb'
 exit
  else
  puts packetid
  exit
 
 
 
 
 end



end


##############################
#    Helping functions       #
##############################
def get_string(original)
length = Array.new(); length = [original.length]
length = length.pack("n")
encoded = original.encode('utf-16be')
encodedbytes = get_bytes_big(encoded)
final = length.unpack("cc") + encodedbytes
return final
end

def get_int_bytes(int)
myint = Array.new(); myint = [int]
myint = myint.pack("N")
bytes = get_bytes(myint)
return bytes
end


def get_bytes(string)
return string.unpack("C*")
end

def get_signedbyte(string)
return string.unpack("c*")
end

def get_bytes_big(string)
unpackstring = ""
(string.length * 2).times do
unpackstring += "C"
end
string = string.unpack(unpackstring)
return string
end

def array_2_string(array)
packstring = ""
array.length.times do
packstring += "c"
end
string = array.pack(packstring)
return string
end

def unpackstring(original)
final = original.force_encoding('utf-16be').encode('utf-8')
return final
end
def fuck_metadata()
x = get_bytes($socket.gets(1))[0].to_i
while x != 127
x = get_bytes($socket.gets(1))[0].to_i
end
end
def parse_metadata()
length = 0
x = get_bytes($socket.gets(1))[0].to_i
length += 1
while x != 127
index = x & 0x1F
ty = x >> 5
case ty
when 0
$socket.gets(1)
length += 1
when 1
$socket.gets(2)
length += 2
when 2
$socket.gets(4)
length += 4
when 3
$socket.gets(4)
length += 4
when 4
length = $socket.gets(2)
length = length.unpack("n")[0].to_i
length += 2
$socket.gets(length * 2)
length += length * 2
when 5
$socket.gets(5)
length += 5
when 6
$socket.gets(12)
length += 12
else
puts length
puts "--"
puts x
puts ty
puts index
puts "This shouldn't happen"
exit
end
x = get_bytes($socket.gets(1))[0].to_i
length += 1
end
puts length
end

def do_slotdata()
blockid = $socket.gets(2)
blockid = blockid.unpack("n")[0].to_i
if blockid == -1
return
else
puts "got item!" + blockid.to_s
count = get_bytes($socket.gets(1))[0].to_i
damage = $socket.gets(2)
damage = damage.unpack("n")[0].to_i
if is_longer(blockid) == true
length = $socket.gets(2)
length = length.unpack("n")[0].to_i
if length == -1
return
else
$socket.gets(length)
end
end
end
end

def is_longer(value)
return  (256 <= value && value <= 259) || (267 <= value && value <= 279) || (283 <= value && value <= 286) || (290 <= value && value <= 294) || (298 <= value && value <= 317) || value == 261 || value == 359 || value == 346;
end
def cleanchat(message)
if message.include?("§") == true
message = message.gsub("§0","")
message = message.gsub("§1","")
message = message.gsub("§2","")
message = message.gsub("§3","")
message = message.gsub("§4","")
message = message.gsub("§5","")
message = message.gsub("§6","")
message = message.gsub("§7","")
message = message.gsub("§8","")
message = message.gsub("§9","")
message = message.gsub("§a","")
message = message.gsub("§b","")
message = message.gsub("§c","")
message = message.gsub("§d","")
message = message.gsub("§e","")
message = message.gsub("§f","")
message = message.gsub("§A","")
message = message.gsub("§B","")
message = message.gsub("§C","")
message = message.gsub("§D","")
message = message.gsub("§E","")
message = message.gsub("§F","")
end
return message

end
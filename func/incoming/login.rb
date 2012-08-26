puts "Login ok!"
eid = $socket.gets(4) #get EID at 4 bytes string
eid = eid.unpack("N")[0] #convert to normal integer, and remove it from the array.
$eid = eid #Set the global variable
$socket.gets(2) #skip the empty string..
stringlength = $socket.gets(2)
stringlength = stringlength.unpack("n")[0].to_i #Get the bytes for the short containing string length
mystring = $socket.gets(stringlength * 2)
mystring = unpackstring(mystring)
$leveltype = mystring
puts "Level type is: " + $leveltype
mode = $socket.gets(4)
$mode = mode.unpack("N")[0]
dim = $socket.gets(4)
$dimension = dim.unpack("N")[0]
$difficulty = get_bytes($socket.gets(1))[0].to_i
$socket.gets(1) #unused byte
$maxplayers = get_bytes($socket.gets(1))[0].to_i
puts "Difficulty level is " + $difficulty.to_s + ", with a player limit of " + $maxplayers.to_s + "."
#Packet Handled#

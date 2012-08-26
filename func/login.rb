require 'open-uri'

def dologin(username,password)
#Login to Minecraft.net, and retreive the hashes required.#
puts "Logging in to Minecraft.net"
reader = open("http://login.minecraft.net/?user=#{username}&password=#{password}&version=13")
contents = reader.read
if contents.include?(":") == false
puts "Failed to login: " + contents
return false
end
mysplit = contents.split(":",4)
$username = mysplit[2]
$sessionid = mysplit[3]
puts "Sessionid: " + $sessionid
return true
end

def do_auth(serverid)
#http://session.minecraft.net/game/joinserver.jsp?user=<username>&sessionId=<session id>&serverId=<server hash>
reader = open("http://session.minecraft.net/game/joinserver.jsp?user=#{$username}&sessionId=#{$sessionid}&serverId=#{serverid}")
contents = reader.read
if contents == "OK"
return true
else
puts contents.to_s
return contents
end
end

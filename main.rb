
require 'socket'

BEGIN {
puts 'Welcome to Ruby Minebot SMP'
puts 'Current version is 0.01 Alpha.'
#Load required functions#
load 'func/settings.rb'
load 'func/login.rb'
load 'func/packet.rb'
}
END {
puts 'Thank you for using the bot!'
}

##########################
#     Variables          #
##########################
$serverip = ""
$serverport = 25565
$username = ""
$password = ""
$onlinemode = true
$sessionid = ""
$looping = 1
$rawbuffer = []
##########################
##########################
# Player/Map Variables   #
##########################
$eid = 0
$leveltype = 0
$mode = 0
$dimension = 0
$difficulty = 0
$maxplayers = 8
$time = 0
$spawn = Hash.new()
$health = 0
$food = 0
$saturation = 0
$players = []
##Location##
$location = Hash.new()
##########################
readsettings()
result = true

if $onlinemode == true || $onlinemode == "true"
result = dologin($username,$password)
end

if result == true
$socket = TCPSocket.open($serverip, $serverport)
puts "Connected."
make(2)
load 'func/loop.rb'
t1 = Thread.new{main_loop()}
t1.join()
end

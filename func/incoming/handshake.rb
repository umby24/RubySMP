length = $socket.gets(2)
length = length.unpack("n")
length = length[0].to_i
mystring = $socket.gets(length * 2)
mystring = unpackstring(mystring)
if mystring == "-"
#May continue
make(1)
else
#Must authenicate first
puts "Authenicating.."
if do_auth(mystring) == true
puts "Done."
make(1)
else
puts "Name verification failure; stopping."
exit
end
end

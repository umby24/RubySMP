def readsettings()
begin
reader = IO.readlines("settings.txt")
reader.each {|line|
a = line[0, line.index("=")]
d = line[line.index("=") + 1, line.length - (line.index("=") + 1)]
if d.include?("\n") then
d = d.chop
end
case a.downcase
  when "username"
    $username = d
  when "password"
    $password = d
  when "ip"
    $serverip = d
  when "port"
    $serverport = d
  when "online"
    $onlinemode = d
end
}
rescue Exception => e
puts "Error loading settings: #{e.message}"
end
end
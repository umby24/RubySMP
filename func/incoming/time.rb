time = get_bytes($socket.gets(8))
time = time.reverse
time = array_2_string(time)
time = time.unpack("q")
$time = time

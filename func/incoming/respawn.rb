dim = $socket.gets(4)
dim = dim.unpack("N")[0].to_i
$dimension = dim
diff = get_bytes($socket.gets(1))[0]
$difficulty = diff
mode = get_bytes($socket.gets(1))[0]
$mode = mode
height = $socket.gets(2)
height = height.unpack("n")[0].to_i
length = $socket.gets(2)
length = length.unpack("n")[0].to_i
type = unpackstring($socket.gets(length * 2))
$leveltype = type
#packet handled

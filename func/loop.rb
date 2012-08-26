def main_loop()
  while $looping == 1
    $id = $socket.gets(1)
	puts get_bytes($id)[0].to_i
	handle(get_bytes($id)[0].to_i)
  end
end

require 'socket'

nodes = [
  ["localhost", 8000],
  ["adit.io", 1234]
]

threads = []
nodes.each do |node|
  t = Thread.new do
    socket = TCPsocket.new(*node)
    socket.send(10.to_s, 0)
    p "sent"
    puts socket.read(2)
    p "read"
    socket.close
  end
  threads << t
end

threads.each(&:join)

require 'rubygems'
require 'eventmachine'

module Node
  def post_init
    p "node started"
  end

  def double x
    x * 2
  end

  def receive_data(data)
    puts data
    send_data double(data.chomp.to_i)
  end
end

port = ARGV[0] || 8000

EM.run do
  EM.start_server "0.0.0.0", port, Node
end

#!/usr/bin/ruby

require "socket"
require "openssl"
require "thread"

listeningPort = 3030

server = TCPServer.new(listeningPort)
sslContext = OpenSSL::SSL::SSLContext.new
sslContext.cert = OpenSSL::X509::Certificate.new(File.open("cert.pem"))
sslContext.key = OpenSSL::PKey::RSA.new(File.open("key.pem"))
sslServer = OpenSSL::SSL::SSLServer.new(server, sslContext)

puts "Listening on port #{listeningPort}"

loop do
  connection = sslServer.accept
  puts connection.gets
  connection.puts "HEHE"
  connection.close
end

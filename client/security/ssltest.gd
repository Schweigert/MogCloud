extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var a
var s

func _ready():
	s = StreamPeerTCP.new()
	print(s.connect("localhost",3030))
	a = StreamPeerSSL.new()
	print(a.connect(s))
	a.put_utf8_string("Hello\n")
	print(a.get_utf8_string(1))
	pass

extends Tween
class_name CardAnimation 


var node: Node2D
var block: bool = false setget set_block


func set_block(b):
	block = b 
	get_owner().animation_blocking = b 
	if b == false:
		get_owner().emit_signal("animation_unblocked")


func _ready():
	get_owner().connect(
		"play_animation", self, "play_animation"
	)
	node = get_parent()
	
	

func play_animation(animation, argv: Array = []):
	if block:
		return 
	callv(animation, argv)

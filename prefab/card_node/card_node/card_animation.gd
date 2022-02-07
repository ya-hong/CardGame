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
	if not has_method(animation):
		return 
		
	callv(animation, argv)


	
func scale_up():
	interpolate_property(
		node, "scale",
		null, Vector2(1.2, 1.2), 0.2,
		Tween.TRANS_QUINT, Tween.EASE_OUT
	)
	start()


func scale_down():
	interpolate_property(
		node, "scale",
		null, Vector2(1, 1), 0.2,
		Tween.TRANS_QUINT, Tween.EASE_IN
	)
	start()


func move_to(position: Vector2):
	interpolate_property(
		get_owner(), "position",
		null, position, 0.2, 
		Tween.TRANS_CUBIC, Tween.EASE_OUT	
	)
	start() 


func trigger():
	interpolate_property(
		node, "scale",
		null, Vector2(1.5, 1.5), 0.3,
		Tween.TRANS_QUINT, Tween.EASE_OUT
	)
	start()
	yield(Clock.count(0.3), 'completed')
	interpolate_property(
		node, "scale",
		null, Vector2(1, 1), 0.3,
		Tween.TRANS_QUINT, Tween.EASE_IN
	)
	start()

tool
extends Node2D



func _process(delta):
	if get_owner():
		visible = get_owner().visible

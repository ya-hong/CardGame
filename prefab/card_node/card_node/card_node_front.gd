tool
extends Node2D
class_name CardNodeFront



func _process(delta):
	if get_owner():
		visible = get_owner().face_up

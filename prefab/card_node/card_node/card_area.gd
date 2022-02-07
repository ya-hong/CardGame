tool
extends Button
class_name CardArea


func _init():
	theme = preload("res://prefab/card_node/resource/card_theme.tres")


func _enter_tree():
	rect_size = get_owner().SIZE
	rect_position = - rect_size / 2
	
	connect("pressed", get_owner(), "emit_signal", ["clicked"])
	connect("mouse_entered", get_owner(), "emit_signal", ['mouse_entered'])
	connect("mouse_exited", get_owner(), "emit_signal", ['mouse_exited'])


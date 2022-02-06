tool 
extends Label



func _enter_tree():
	rect_size = get_owner().size
	rect_position = - rect_size / 2
	align = Label.ALIGN_CENTER
	valign = Label.VALIGN_CENTER

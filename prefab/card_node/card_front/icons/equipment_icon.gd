extends ReferenceRect



func _enter_tree():
	visible = get_owner().card is Equipment
	

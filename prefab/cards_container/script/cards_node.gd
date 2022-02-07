extends Node2D
class_name CardsNode


var rng = RandomNumberGenerator.new()

func _enter_tree():
	position = get_owner().rect_size / 2


func _ready():
	rng.randomize()
	
	get_owner().connect("resized", self, "on_owner_resized")

	get_owner().connect("appended", self, "on_appended")
	get_owner().connect("erased", self, "on_erased")
	get_owner().connect("replaced", self, "on_replaced")
	get_owner().connect("focused", self, "on_focused")
	get_owner().connect("unfocused", self, "on_unfocused")



func on_appended(prefab: CardNode):
	add_child(prefab)
	if owner.append_animation:
		prefab.emit_signal("play_animation", owner.append_animation)



func on_erased(prefab: CardNode):
	remove_child(prefab) 
	 



func on_replaced(old_prefab: CardNode, new_prefab: CardNode):
	new_prefab.position = old_prefab.position
	new_prefab.rotation_degrees = old_prefab.rotation_degrees
	old_prefab.replace_by(new_prefab)
	if owner.replace_animation:
		new_prefab.emit_signal("play_animation", owner.replace_animation)



func on_focused(prefab: CardNode):
	if owner.focus_animation:
		prefab.emit_signal("play_animation", owner.focus_animation)
	
	
func on_unfocused(prefab: CardNode):
	if owner.unfocus_animation:
		prefab.emit_signal("play_animation", owner.unfocus_animation)


		
func on_owner_resized():
	position = get_owner().rect_size / 2

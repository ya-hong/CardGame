extends "cards_queue.gd"


func on_appended(prefab: CardNode):
	if get_child_count():
		var prev: CardNode = get_children().back()
		prefab.position = prev.position
		prefab.rotation_degrees = prev.rotation_degrees
	
	prefab.position.y += rng.randfn(0, 2)
	prefab.rotation_degrees += rng.randfn(0, 2)

	.on_appended(prefab) 

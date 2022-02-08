tool
extends "cards_queue.gd"


func on_appended(prefab: CardNode):
	prefab.position.y = rng.randfn(0, 4)
	prefab.rotation_degrees = rng.randfn(0, 6)

	.on_appended(prefab) 

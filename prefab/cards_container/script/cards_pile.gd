tool
extends CardsNode



func on_appended(prefab: CardNode):
	var SIZE = Constants.CARD_SIZE
	if get_child_count():
		var prev: CardNode = get_children().back()
		prefab.position = prev.position - SIZE / 100
		prefab.rotation_degrees = prev.rotation_degrees
	
	prefab.position += Vector2(
		rng.randfn(0, 2),
		rng.randfn(0, 2)
	)
	prefab.rotation_degrees += rng.randfn(0, 1)

	.on_appended(prefab) 

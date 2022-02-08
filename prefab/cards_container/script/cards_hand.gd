tool
extends "cards_queue.gd"


func _init():
	max_separation = 104
	
	
func _enter_tree():
	get_owner().rect_min_size = Vector2(
		Constants.CARD_SIZE.x * 3 + 8,
		Constants.CARD_SIZE.y 
	)


func move_prefab_x_to(prefab: CardNode, x: float):
	prefab.emit_signal("play_animation", "move_to", [Vector2(
		x, prefab.position.y
	)])


func on_focused(prefab):
	var n = get_child_count()
	if n <= 2:
		return 

	var idx = get_children().find(prefab)
	var SIZE = Constants.CARD_SIZE 

	var count = 2 - int(idx == n - 1)
	var separation = (width - SIZE.x * count) / (n - count)
	if separation >= SIZE.x:
		return 

	var x = -width / 2 + SIZE.x / 2
	move_prefab_x_to(get_child(0), x)
	for i in range(1, idx + 1):
		x += separation
		move_prefab_x_to(get_child(i), x)
	
	if idx == n - 1:
		return 

	x += SIZE.x
	move_prefab_x_to(get_child(idx + 1), x) 

	for i in range(idx + 2, n):
		x += separation
		move_prefab_x_to(get_child(i), x)



func on_unfocused(prefab):
	adjust()

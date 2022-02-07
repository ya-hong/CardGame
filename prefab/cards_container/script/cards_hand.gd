extends "cards_queue.gd"


func _init():
	max_separation = 104


func on_focused(prefab):
	var n = get_child_count()
	var idx = get_children().find(prefab)

	if idx == n - 1:
		return 

	var delta = max_separation - (
		get_child(idx + 1).position.x - 
		prefab.position.x
	)

	for i in range(idx + 1, n):
		var child = get_child(i) 
		child.emit_signal(
			"play_animation", "move_to", 
			[child.position + Vector2(delta, 0)]
		)
		var m = n - i - 1
		delta *= (m - 1) / m

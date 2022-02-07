extends CardsNode

var width
export(int) var max_separation = 175

func _enter_tree():
	width = get_owner().rect_size.x 


func _ready():
	get_owner().connect("resized", self, "on_owner_resized")


func adjust():
	var n = get_child_count()
	var separation = max_separation
	if (n - 1) * separation + CardNode.SIZE.x > width:
		separation = (width - CardNode.SIZE.x) / n
	var pos = position.x - (n - 1) * separation / 2
	for i in range(n):
		var child: CardNode = get_child(i)
		child.emit_signal(
			"play_animation", "move_to", 
			[Vector2(pos + i * separation,child.position.y)]
		)


func on_appended(prefab: CardNode):
	.on_appended(prefab) 
	adjust()


func on_erased(prefab: CardNode):
	.on_erased(prefab)
	adjust()


func on_owner_resized():
	.on_owner_resized()
	width = get_owner().rect_size.x
	adjust() 
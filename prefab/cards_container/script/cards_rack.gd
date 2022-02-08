tool
extends CardsNode 



var vboxcontainer: VBoxContainer
var separation: int = 4 setget set_separation
var sub_scene: CardNode 


func _enter_tree():
	get_owner().prefab_size_type = Constants.SizeType.SMALL
	var min_size = Vector2(
		Constants.SMALL_CARD_SIZE.x,
		Constants.CARD_SIZE.y
	)
	get_owner().rect_min_size = min_size 



func set_separation(_separation):
	var max_separation = 4
	separation = _separation
	if separation > max_separation:
		separation = max_separation
	vboxcontainer.set("custom_constants/separation", separation)



func adjust(n: int):
	if n <= 1:
		return
	var SIZE = Constants.SMALL_CARD_SIZE
	var length = get_owner().rect_size.y 
	set_separation(floor((length - SIZE.y * n) / (n - 1)))


func _ready():
	vboxcontainer = VBoxContainer.new()
	add_child(vboxcontainer)


func on_owner_resized():
	.on_owner_resized()
	var size = get_owner().rect_size
	adjust(vboxcontainer.get_child_count())
	vboxcontainer.rect_size = size
	vboxcontainer.rect_position = - size / 2



func on_appended(prefab: CardNode):
	var container = Control.new()
	container.rect_min_size = prefab.SIZE
	container.add_child(prefab)
	prefab.position = prefab.SIZE / 2
	
	adjust(vboxcontainer.get_child_count() + 1)
	
	vboxcontainer.add_child(container)
	
	if owner.append_animation:
		prefab.emit_signal("play_animation", owner.append_animation)



func on_erased(prefab: CardNode):
	var container = prefab.get_parent()
	container.remove_child(prefab)
	vboxcontainer.remove_child(container)
	adjust(vboxcontainer.get_child_count())
	


func on_focused(prefab: CardNode):
	var card = prefab.card
	sub_scene = card.Prefab.instance()
	sub_scene.setup(card)
	sub_scene.position.x = sub_scene.SIZE.x * 0.8
	add_child(sub_scene)
	sub_scene.find_node("CardArea").free()


func on_unfocused(prefab: CardNode):
	sub_scene.queue_free()

tool
extends CardsNode 


var grid_container: GridContainer


func _ready():
	grid_container = GridContainer.new()
	add_child(grid_container)


func on_appended(prefab):
	var SIZE = Constants.CARD_SIZE

	var container = Control.new()
	container.rect_min_size = SIZE
	container.add_child(prefab)
	prefab.position = SIZE / 2
	grid_container.add_child(container) 
	
	if owner.append_animation:
		prefab.emit_signal("play_animation", owner.append_animation)


func on_erased(prefab):
	var container = prefab.get_parent()
	container.remove_child(prefab)
	grid_container.remove_child(container)



func on_owner_resized():
	.on_owner_resized()
	var size = get_owner().rect_size
	grid_container.rect_size = size
	grid_container.rect_position = - size / 2
	grid_container.columns = int((size.x + 4) / 104)


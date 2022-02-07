tool
extends Sprite



func _process(delta):
	if not texture:
		return 
	
	var size = get_owner().SIZE
	
	var t_size = texture.get_size()
	if region_enabled:
		t_size = region_rect.size
	
	scale = Vector2(
		size.x / t_size.x,
		size.y / t_size.y 
	)

tool 
extends Label


func adjust(gsize, gscale):
	rect_scale = Vector2(1 / gscale.x, 1 / gscale.y)
	rect_size = gsize 
	get("custom_fonts/font").set_size(rect_size.y / 2)


func _enter_tree():
	align = Label.ALIGN_CENTER
	valign = Label.VALIGN_CENTER
	
	var gscale = get_owner().global_scale
	var size = gscale * get_owner().SIZE
	adjust(size, gscale)

func _process(delta):
	visible = get_owner().is_visible_in_tree()

	var gscale = get_owner().global_scale
	var new_size = get_owner().SIZE * gscale
	
	if rect_size == new_size:
		return 
		
	adjust(new_size, gscale)

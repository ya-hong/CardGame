tool
extends Sprite 
class_name CardImage 


export(Vector2) var size 


func _enter_tree():
	if get_owner().card && get_owner().card.get('texture'):
		texture = get_owner().card.texture 


func _process(delta):
	if not texture:
		return 
		
	var t_size = texture.get_size()
	var kx = t_size.x / size.x 
	var ky = t_size.y / size.y
	var k = min(kx, ky)
	var new_size = size * k
	
	region_enabled = true 
	region_rect.size = new_size
	region_rect.position = (t_size - new_size) / 2
	
	scale = Vector2(1, 1) / k  
	

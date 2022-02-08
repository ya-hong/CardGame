# 血条、蓝条、体力条

extends Resource
class_name State 


enum ColorType {
	HP, ST, MP 
}


export(int) var max_value setget set_max_value 
export(int) var value setget set_value
export(ColorType) var color_type  


var color: Color setget , get_color


func set_max_value(max_v):
	max_value = max_v 
	if value > max_v:
		value = max_v 
	emit_changed()


func set_value(v):
	value = v 
	if value < 0:
		value = 0 
	if value > max_value:
		value = max_value
	emit_changed()



func get_color():
	match color_type:
		ColorType.HP:
			return Constants.HP_COLOR
		ColorType.ST:
			return Constants.ST_COLOR
		ColorType.MP:
			return Constants.MP_COLOR
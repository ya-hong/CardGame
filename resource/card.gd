extends Resource
class_name Card 


signal selected # 被选择了（通常是被点击） 
signal actived # 变得可选（与Dealer配合使用）
signal inactived # 变得不可选（与Dealer配合使用，Deal.select 结束时触发）


# 卡牌名称
export(String) var card_name = "no name"


# focus时显示的卡牌描述
export(String) var info = "" setget , _get_info 

func _get_info(): # 继承此函数来定制卡牌描述
	return info 


# 卡图
export(Texture) var texture setget , _get_texture 

func _get_texture():
	return texture


# 用于显示卡牌的子场景
export(PackedScene) var SmallPrefab = load("res://prefab/card_node/small_card_node.tscn")
export(PackedScene) var Prefab = load("res://prefab/card_node/normal_card_node.tscn")



func _init():
	resource_local_to_scene = true 



func get_prefab():
	if Prefab == null:
		push_error("此卡牌无可使用的子场景")
		return null 
	
	var prefab = Prefab.instance()
	prefab.setup(self) 
	return prefab 

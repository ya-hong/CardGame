extends Card 
class_name Character


export(Resource) var state = State.new() 
export(Resource) var hands = Deck.new()
export(Resource) var equipments = Deck.new()


func _init():
	Prefab = load("res://prefab/card_node/character_node.tscn")

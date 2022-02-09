extends MarginContainer


var journey: Journey = Journey.new()

var pile_node: CardContinaer
var events_node: CardContinaer
var character_node: CardNode


func _enter_tree():
	var card = preload("res://data/event/init.tres")
	var character = Character.new()
	character.card_name = "Alice"
	
	journey.pile.append(card)
	journey.player = character
	
	pile_node = find_node("Pile")
	events_node = find_node("Events")
	character_node = find_node("Character")
	
	pile_node.setup(journey.pile)
	events_node.setup(journey.events)
	character_node.setup(character)



func _ready():
	events_node.connect("clicked", self, "on_events_clicked") 



func on_events_clicked(prefab: CardNode):
	var card = prefab.card 
	card.handler(journey)


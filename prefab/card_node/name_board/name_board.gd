extends Node2D


export(Vector2) var size = Vector2(96, 29)


var card: Card


func setup(card):
	self.card = card 


func _enter_tree():
	if card == null:
		setup(Card.new())

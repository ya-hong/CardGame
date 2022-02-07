extends Node2D


const SIZE = Vector2(96, 29)


var card: Card


func _enter_tree():
	card = get_owner().card 

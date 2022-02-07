extends Node2D 



var card: Card


func _enter_tree():
	card = get_owner().card 

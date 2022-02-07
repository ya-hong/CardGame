extends HBoxContainer


var card: Card

func _enter_tree():
	card = get_owner().card 

extends Resource
class_name Deck 


signal appended(card)
signal erased(card)
signal replaced(old_card, new_card)


export(Array, Resource) var deck 


func append(card: Card):
	deck.append(card)
	emit_signal("appended", card)
	emit_changed() 


func erase(card: Card):
	if card in deck:
		deck.erase(card)
		emit_signal("erased", card)
		emit_changed() 
	else:
		push_error('no card to erase')


func replace(old_card: Card, new_card: Card):
	if old_card in deck:
		var idx = deck.find(old_card)
		deck[idx] = new_card
		emit_signal("replaced", old_card, new_card)
		emit_changed()
	else:
		push_error("no card to replace")


func pop():
	if deck.empty():
		push_error('no card to pop')
		return null 
	var card = deck.back()
	erase(card) 
	return card 


func len(): 
	return len(deck) 


func has(card: Card):
	return card in deck 


func get_cards():
	return deck.duplicate() 
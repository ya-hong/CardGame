extends CMD 
class_name CMD_Gain 


var target: Fighter
var card: Hand 

func _init(target: Fighter, card: Hand):
	self.target = target
	self. card = card 


func start(battle: Battle):
	var hand: Deck = target.decks[Fighter.HAND]
	var discard: Deck = target.decks[Fighter.DISCARD]
	if hand.len() < 10:
		hand.append(card)
	else:
		discard.append(card) 
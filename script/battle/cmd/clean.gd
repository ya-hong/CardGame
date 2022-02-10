extends CMD 
class_name CMD_Clean 


var card: Hand 


func _init(card: Hand):
	self.card = card 


func start(battle: Battle):
	battle.table.erase(card) 
	var owner: Fighter = battle.owner[card]
	var discard: Deck = owner.decks[Fighter.DISCARD]
	battle.user[card] = null 
	discard.append(card) 
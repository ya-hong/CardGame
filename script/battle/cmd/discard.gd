extends CMD 
class_name CMD_Discard 


var target: Fighter
var card: Hand 


func _init(target: Fighter, card: Hand):
	self.target = target 
	self.card = card 


func start(battle: Battle):
	var hand: Deck = target.decks[Fighter.HAND]
	var table: Deck = battle.table
	
	hand.erase(card) 
	table.append(card) 
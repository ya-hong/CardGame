class_name Battle 



var fighters: Array = [
	Fighter.new(), 
	Fighter.new()
]

var owner: Dictionary 
var user: Dictionary 


func setup(card1: Character, card2: Character):
	setup_fighter(fighters[0], card1)
	setup_fighter(fighters[1], card2) 


func setup_fighter(fighter: Fighter, card: Character):
	fighter.character = card 
	fighter.state = card.state.duplicate() 
	for card in fighter.character.hands.get_cards():
		card.battle_init(self)
		fighter.decks[Fighter.HAND].append(card) 
	for card in fighter.character.equipments.get_cards():
		card.battle_init(self)
		fighter.decks[Fighter.EQUIP].append(card)




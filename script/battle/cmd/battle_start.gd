extends CMD 
class_name CMD_BattleStart 


var card0: Character
var card1: Character

func _init(card0: Character, card1: Character):
	self.card0 = card0 
	self.card1 = card1 


func start(battle: Battle):
	setup_fighter(battle, battle.fighters[0], card0)
	setup_fighter(battle, battle.fighters[1], card1)

	var ret
	ret = CMD_Draw.new(battle.fighters[0], 3).start(battle)
	if ret is GDScriptFunctionState:
		yield(ret, 'completed')
	
	ret = CMD_Draw.new(battle.fighters[1], 4).start(battle)
	if ret is GDScriptFunctionState:
		yield(ret, 'completed')
	
	battle.current = battle.fighters[0]


func setup_fighter(battle: Battle, fighter: Fighter, card: Character):
	fighter.character = card 
	fighter.state = card.state.duplicate() 
	for card in fighter.character.hands.get_cards():
		battle.owner[card] = fighter
		card.battle_init(self)
		fighter.decks[Fighter.DRAW].append(card) 
	for card in fighter.character.equipments.get_cards():
		battle.owner[card] = fighter
		card.battle_init(self)
		fighter.decks[Fighter.EQUIP].append(card)

	
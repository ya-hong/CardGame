extends CMD
class_name CMD_Use 


var target: Fighter
var card: Hand 


func _init(target: Fighter, card: Hand):
	self.target = target
	self.card = card 


func start(battle: Battle):
	var draw: Deck = target.decks[Fighter.DRAW]
	var hand: Deck = target.decks[Fighter.HAND]

	battle.user[card] = target

	# 移动到对应区域
	if draw.has(card):
		draw.erase(card)
	if hand.has(card):
		hand.erase(card) 
	if card is Equipment:
		target.decks[Fighter.EQUIP].append(card)
	else:
		battle.table.append(card) 

	# 触发效果
	var ret = card.skill.start(battle, target)
	if ret is GDScriptFunctionState:
		yield(ret, 'completed')

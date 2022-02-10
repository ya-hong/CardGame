class_name CMD 


enum {
	BEGIN, AFTER, CANCEL 
}


var state = BEGIN


func start(battle: Battle):
	pass 



func execute(battle: Battle):
	if battle.is_end():
		return 

	var ret = trigger(battle)
	if ret is GDScriptFunctionState:
		yield(ret, 'completed')

	yield(Clock, 'cycle')
	if state == BEGIN:
		ret = start(battle)
		if ret is GDScriptFunctionState:
			yield(ret, 'completed') 
	
	ret = trigger(battle)
	if ret is GDScriptFunctionState:
		yield(ret, 'completed')
	

func trigger(battle: Battle):
	# 触发场上的牌
	for card in battle.table.get_cards():
		if not battle.table.has(card) || not battle.user[card]:
			continue 
		var ret = trigger_card(card, battle, battle.user[card])
		if ret is GDScriptFunctionState:
			yield(ret, 'completed')
	
	var fighters = [battle.current, battle.enemy(battle.current)]

	# 触发装备牌
	for fighter in fighters:
		var deck = fighter.decks[Fighter.EQUIP]
		for card in deck.get_cards():
			if not deck.has(card):
				continue
			var ret = trigger_card(card, battle, fighter) 
			if ret is GDScriptFunctionState:
				yield(ret, 'completed')
		
	# 触发被动牌
	for fighter in fighters:
		var deck = fighter.decks[Fighter.HAND]
		for card in deck.get_cards():
			if not deck.has(card):
				continue
			if not card.skill.passive(battle, fighter, self):
				continue
			yield(CMD_Use.new(fighter, card).execute(battle), 'completed') 
	
	# 召唤牌
	for fighter in fighters:
		var hand = fighter.decks[Fighter.HAND]
		var draw = fighter.decks[Fighter.DRAW]
		var cards = hand.get_cards().append_array(draw.get_cards())
		for card in cards:
			if not draw.has(card) && not hand.has(card):
				continue
			if not card.skill.summon(battle, fighter, self):
				continue
			yield(CMD_Use.new(fighter, card).execute(battle), 'completed')
			
	
				

func trigger_card(card: Hand, battle: Battle, user: Fighter):
	var method = card.skill.trigger(battle, user, self) 
	if not method:
		return 
	var ret = card.skill.call(method, battle, user, self)
	if ret is GDScriptFunctionState:
		yield(ret, 'completed')
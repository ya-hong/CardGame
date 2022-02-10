extends CMD 
class_name CMD_Draw 


var target: Fighter
var num: int 


func _init(target: Fighter, num: int):
	self.target = target
	self.num = num 


func start(battle: Battle):
	var draw: Deck = target.decks[Fighter.DRAW]
	var hand: Deck = target.decks[Fighter.HAND]
	var discard: Deck = target.decks[Fighter.DISCARD]
	for i in range(num):
		if draw.len() == 0:
			var cards = discard.get_cards()
			cards.shuffle()
			while discard.len():
				discard.pop()
			for card in cards:
				draw.append(card) 
		if draw.len():
			var card = draw.pop() 
			yield(CMD_Gain.new(target, card).execute(battle), 'completed') 
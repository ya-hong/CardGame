class_name Battle 



var fighters: Array = [
	Fighter.new(), 
	Fighter.new()
]

var current: Fighter

var table: Deck = Deck.new()

var owner: Dictionary 
var user: Dictionary 



func is_end():
	return fighters[0].hp.value == 0 || fighters[1].hp.value == 0 


func enemy(var fighter):
	for f in fighters:
		if f != fighter:
			return f 
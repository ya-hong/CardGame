extends CMD 
class_name CMD_Hurt


enum {
	NORMAL, 
	POISON,
	FIRE, ICE, THUNDER, 
}


var target: Fighter
var num: int setget set_num 
var type: int = NORMAL
var source_card: Hand
var source: Fighter


func set_num(n: int):
	num = n 
	if num < 0:
		num = 0 
	

func _init(target: Fighter, num: int, 
		type: int = NORMAL, source_card: Hand = null, source: Fighter = null):
	self.target = target
	set_num(num)
	self.type = type
	self.source_card = source_card
	self.source = source
	
	
func start(battle: Battle):
	target.hp.value -= num 


extends CMD 
class_name CMD_Heal 


var target: Fighter
var num: int setget set_num 

func set_num(n: int):
	num = n 
	if num < 0:
		num = 0


func _init(target: Fighter, num: int):
	self.target = target
	set_num(num) 


func start(battle: Battle):
	target.hp.value += num 
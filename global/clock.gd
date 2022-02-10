extends Node


signal cycle 


func count(t: float):
	yield(get_tree().create_timer(t), 'timeout')



var cnt: int  = 0

func _process(delta):
	cnt += 1
	if cnt == 10:
		emit_signal("cycle")
		cnt = 0 
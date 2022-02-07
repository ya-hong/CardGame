extends Node


func count(t: float):
	yield(get_tree().create_timer(t), 'timeout')

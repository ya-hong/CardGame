tool 
extends Node2D
class_name CardNode 


signal clicked
signal mouse_entered
signal mouse_exited 
signal play_animation(animation, argv)
signal animation_unblocked


export(Resource) var card

export(bool) var face_up = true 


export(Constants.SizeType) var size_type = Constants.SizeType.NORMAL


var SIZE: Vector2 setget , get_SIZE  

var animation_blocking: bool = false


func get_SIZE():
	return Constants.get_card_size(size_type) 


func setup(card):
	self.card = card


#func _enter_tree():
#	if card == null:
#		setup(Card.new())

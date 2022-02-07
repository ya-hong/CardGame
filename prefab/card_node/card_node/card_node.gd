extends Node2D


const SIZE = Vector2(100, 128)


signal clicked
signal mouse_entered
signal mouse_exited 
signal play_animation(animation, argv)
signal animation_unblocked


export(Resource) var card

export(bool) var face_up = true 

var animation_blocking: bool = false



func setup(card):
	self.card = card


func _enter_tree():
	if card == null:
		setup(Card.new())

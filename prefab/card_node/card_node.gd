extends Node2D


const SIZE = Vector2(100, 128)


signal clicked
signal mouse_entered
signal mouse_exited 
signal play_animation(animation)


export(bool) var face_up = false 

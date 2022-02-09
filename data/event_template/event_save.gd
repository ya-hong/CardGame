extends Event
class_name EventSave


func _init():
	card_name = "存档点"


func handler(journey: Journey):
	journey.events.erase(self) 
	ResourceSaver.save("res://test.tres", journey)
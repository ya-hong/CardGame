extends ReferenceRect
class_name StateNode 


export(Resource) var state 

var front_node: ColorRect
var number_node: Label


func setup(state: State):
	self.state = state 


func _enter_tree():
	front_node = get_node("Front")
	number_node = get_node("Number")


func _ready():
	state.connect("changed", self, 'on_state_changed')
	on_state_changed()
	
	
func on_state_changed():
	front_node.color = state.color
	var width = rect_size.x 
	front_node.rect_size.x = width * state.value / state.max_value 
	number_node.text = str(state.value) + '/' + str(state.max_value)

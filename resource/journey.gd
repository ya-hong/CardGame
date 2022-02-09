extends Resource
class_name Journey 


# 事件堆
export(Resource) var pile = Deck.new()

# 可选事件
export(Resource) var events = Deck.new()

export(Resource) var player



func _init():
	pile.connect("changed", self, "emit_changed")
	events.connect("changed", self, "emit_changed")
	assert(pile is Deck)
	assert(events is Deck)
	# assert(player is Card)

	connect("changed", self, "on_changed") 



func on_changed():
	while events.len() < 3 && pile.len():
		var card = pile.pop()
		events.append(card) 

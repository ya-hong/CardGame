extends Resource
class_name Fighter 


enum {
	DRAW, HAND, EQUIP, DISCARD 
}


export(Resource) var character 
export(Resource) var state
export(Array, Resource) var decks = [
	Deck.new(), Deck.new(), Deck.new(), Deck.new()
]

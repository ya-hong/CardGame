extends ReferenceRect
class_name CardContinaer 


signal appended(prefab)
signal erased(prefab)
signal replaced(old_prefab, new_prefab)
signal focused(prefab)
signal unfocused(prefab)


export(String) var append_animation
export(String) var erase_animation
export(String) var replace_animation
export(String) var focuse_animation
export(String) var unfocuse_animation


var deck: Deck
var dict: Dictionary = {}


func setup(deck):
	self.deck = deck 
	deck.connect("appended", self, "on_deck_appended")
	deck.connect("erased", self, "on_deck_erased")
	deck.connect("replaced", self, "on_deck_replaced")
	
	

func _ready():
	for card in deck.get_cards():
		on_deck_appended(card)


func on_deck_appended(card: Card):
	var prefab: CardNode = card.Prefab.instance()
	prefab.setup(card)
	dict[card] = prefab
	emit_signal("appended", prefab)
	
	
func on_deck_erased(card: Card):
	var prefab: CardNode = dict[card]
	dict.erase(card)
	emit_signal("erased", prefab)


func on_deck_replaced(old_card: Card, new_card: Card):
	var old_prefab: CardNode = dict[old_card]
	var new_prefab: CardNode = new_card.Prefab.instance()
	new_prefab.setup(new_card)
	dict[new_card] = new_prefab
	emit_signal("replaced", old_prefab, new_prefab)
	
	
func on_prefab_mouse_entered(prefab: CardNode):
	emit_signal("focused", prefab)


func on_prefab_mouse_exited(prefab: CardNode):
	emit_signal("unfocused", prefab)


func connect_prefab(prefab: CardNode):
	prefab.connect("mouse_entered", self, "on_prefab_mouse_entered", [prefab])
	prefab.connect("mouse_exited", self, "on_prefab_mouse_exited", [prefab])


func disconnect_prefab(prefab: CardNode):
	prefab.disconnect("mouse_entered", self, "on_prefab_mouse_entered")
	prefab.disconnect("mouse_exited", self, "on_prefab_mouse_exited")


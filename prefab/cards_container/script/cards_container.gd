tool
extends ReferenceRect
class_name CardContinaer 


signal appended(prefab)
signal erased(prefab)
signal replaced(old_prefab, new_prefab)
signal focused(prefab)
signal unfocused(prefab)
signal clicked(prefab)


# 将要使用的prefab类型
export(Constants.SizeType) var prefab_size_type = Constants.SizeType.NORMAL


# 各种时机播放的动画
export(String) var append_animation
export(String) var erase_animation
export(String) var replace_animation
export(String) var focus_animation
export(String) var unfocus_animation


var PREFAB_SIZE setget , get_PREFAB_SIZE

var deck: Deck
var dict: Dictionary = {}


func get_PREFAB_SIZE():
	return Constants.get_card_size(prefab_size_type) 


func setup(deck):
	self.deck = deck 
	
	

func _ready():
	connect("resized", self, "on_resized")
	on_resized()
	
	if not deck:
		return 
	for card in deck.get_cards():
		on_deck_appended(card)
	deck.connect("appended", self, "on_deck_appended")
	deck.connect("erased", self, "on_deck_erased")
	deck.connect("replaced", self, "on_deck_replaced")


func on_resized():
	rect_pivot_offset = rect_size / 2


func on_deck_appended(card: Card):
	var prefab: CardNode
	
	match prefab_size_type:
		Constants.SizeType.NORMAL:
			prefab = card.Prefab.instance()
		Constants.SizeType.SMALL:
			prefab = card.SmallPrefab.instance() 
	
	prefab.setup(card)
	dict[card] = prefab
	connect_prefab(prefab)
	emit_signal("appended", prefab)
	
	
func on_deck_erased(card: Card):
	var prefab: CardNode = dict[card]
	dict.erase(card)
	disconnect_prefab(prefab)
	emit_signal("erased", prefab)


func on_deck_replaced(old_card: Card, new_card: Card):
	var old_prefab: CardNode = dict[old_card]
	var new_prefab: CardNode = new_card.Prefab.instance()
	new_prefab.setup(new_card)
	dict[new_card] = new_prefab
	disconnect_prefab(old_prefab)
	connect_prefab(new_prefab)
	emit_signal("replaced", old_prefab, new_prefab)


func connect_prefab(prefab: CardNode):
	prefab.connect("mouse_entered", self, "emit_signal", ["focused", prefab])
	prefab.connect("mouse_exited", self, "emit_signal", ["unfocused", prefab])
	prefab.connect("clicked", self, "emit_signal", ["clicked", prefab]) 


func disconnect_prefab(prefab: CardNode):
	prefab.disconnect("mouse_entered", self, "emit_signal")
	prefab.disconnect("mouse_exited", self, "emit_signal")
	prefab.disconnect("clicked", self, "emit_signal")

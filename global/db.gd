class_name Constants 


enum SizeType {
	NORMAL, SMALL 
}

const CARD_SIZE = Vector2(100, 128)
const SMALL_CARD_SIZE = Vector2(96, 29)


static func get_card_size(type):
	match type:
		SizeType.NORMAL:
			return CARD_SIZE
		SizeType.SMALL:
			return SMALL_CARD_SIZE

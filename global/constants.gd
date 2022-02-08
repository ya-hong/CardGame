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



const HP_COLOR: Color = Color(0.976471, 0.439216, 0.439216) 
const ST_COLOR: Color = Color(0.172422, 0.84375, 0.168091, 0.607843)
const MP_COLOR: Color = Color(0.793518, 0.222656, 1, 0.607843)
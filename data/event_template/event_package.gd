extends Event
class_name EventPackage


# 事件卡牌集合
export(Array, Resource) var events 



func handler(journey: Journey):
	while journey.pile.len():
		journey.pile.pop()
	while journey.events.len():
		journey.events.pop()
	print(events)
	events.shuffle()
	for card in events:
		journey.pile.append(card.duplicate()) 

	print(journey.pile.get_cards())
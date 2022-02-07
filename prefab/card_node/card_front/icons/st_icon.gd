extends ReferenceRect


var skill: HandSkill
var label: Label


func _enter_tree():
	label = get_node("Label")


func _process(delta):
	if not get_owner().get('card'):
		return 
	var card = get_owner().card 

	if not card is Hand:
		return 
		
	if card.skill:
		skill = card.skill
	if not skill:
		skill = card.Skill.new() 
		
	label.text = str(skill.st) 

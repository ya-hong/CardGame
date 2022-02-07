extends Card 
class_name Hand 



# 卡牌消耗
export(int) var mp 
export(int) var st 

# 卡牌效果
export(Script) var Skill

# 是否为装备
export(bool) var equipment 


var skill 

func battle_init(battle):
	skill = Skill.new().setup(self, battle)

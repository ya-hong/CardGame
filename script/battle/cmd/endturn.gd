extends CMD 
class_name CMD_Endturn 


func start(battle: Battle):
	# 清理牌桌
	for card in battle.table.get_cards():
		yield(CMD_Clean.new(card).execute(battle), 'completed')
	
	# 抽牌	
	yield(CMD_Draw.new(battle.current, 2), 'completed')
	
	# 恢复体力
	battle.current.st.value += battle.current.st.max_value
	
	# 切换当前角色
	battle.current = battle.enemy(battle.current)
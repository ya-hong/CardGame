extends Card 
class_name Event 


enum SceneMod {
	NO, # 无子场景
	SUB, # 使场景出现在JourneyScene的子场景框中
	FULL, # 全屏事件场景，并隐藏JourneyScene直至事件场景结束
	
	DIALOG, # 对话，暂时不实现
}



# 子场景
export(PackedScene) var Scene 


# 决定JourneyScene如何处理子场景
export(SceneMod) var scene_mod = SceneMod.NO


var scene


func handler(journey: Journey):
	if (
			Scene && scene_mod != SceneMod.NO
		) && (
			not scene || not is_instance_valid(scene)
	):
		scene = Scene.instance()
	
	pass 
extends Node

var map = preload("res://scene/map_scene.tscn")

func _change_scene(scene: String):
	get_tree().change_scene_to_file(scene)

func change_to_daylight():
	GameStateManager.cur_day += 1
	GameStateManager.cur_time = DayTime.DayTime.Morning
	print(map)
	get_tree().change_scene_to_packed(map)
	pass

func change_to_night():
	GameStateManager.cur_time = DayTime.DayTime.Evening
	get_tree().change_scene_to_packed(map)
	pass

func change_to_home():
	GameStateManager.cur_time = DayTime.DayTime.Midnight
	pass

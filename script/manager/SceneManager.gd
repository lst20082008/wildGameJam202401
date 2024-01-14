extends Node

# map = preload()

func _change_scene(scene: String):
	get_tree().change_scene_to_file(scene)

func change_to_daylight():
	pass

func change_to_night():
	pass

func change_to_home():
	pass

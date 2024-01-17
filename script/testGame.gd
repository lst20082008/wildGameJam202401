extends Node2D

@export var reduce_num: int
@export var add_num: int

func _on_sub_on_clicked():
	print("sub")
	GameStateManager.reduce_overload(reduce_num)
	print(GameStateManager.overload)
	pass # Replace with function body.


func _on_add_on_clicked():
	print("add")
	GameStateManager.add_overload(add_num)
	print(GameStateManager.overload)
	pass # Replace with function body.


func _on_daymap_on_clicked():
	SceneManager.change_to_daylight()
	pass # Replace with function body.


func _on_nightmap_on_clicked():
	SceneManager.change_to_night()
	pass # Replace with function body.

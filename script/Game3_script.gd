extends GameSceneBase

@export var temp = 20
@export var max_temp = 80
@export var min_temp = 50
@onready var progress_bar: ProgressBar = $ProgressBar
@onready var timer: Timer = $Timer

# Called when the node enters the scene tree for the first time.
func _ready():
	super()
	progress_bar.value = temp
	timer.start(10)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if temp > max_temp or temp < min_temp:
		GameStateManager.reduce_overload((40 - 0.2 * GameStateManager.overload) * delta)
	else:
		GameStateManager.add_overload((10 + 0.4 * GameStateManager.overload + temp * 0.1) * delta)
	temp -= randf_range(5.0,20.0) * delta
	progress_bar.value = temp
	if not timer.is_stopped():
		print(timer.time_left)
	pass


func _on_sub_on_clicked():
	#temp -= 5
	pass # Replace with function body.


func _on_add_on_clicked():
	temp += randf_range(5.0,15.0)
	pass # Replace with function body.
	
func victory():
	super()
	print("wyyyyyyy")
	print("Overload value is:", GameStateManager.overload)
	timer.stop()
	SceneManager.to_next_scene()


func _on_timer_timeout():
	victory()
	pass # Replace with function body.

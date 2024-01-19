extends GameSceneBase

@export var temp = 50
@export var mid_temp = 50
@export var max_temp = 65
@export var min_temp = 35
@onready var progress_bar: ProgressBar = $ProgressBar
@onready var timer: Timer = $Timer
@onready var label: Label = $LabelTime

# Called when the node enters the scene tree for the first time.
func _ready():
	super()
	progress_bar.value = temp
	timer.start(10)
	label.text = "10"
	print("Target range is: ", min_temp," - ", max_temp)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	label.text = str(floor(timer.time_left))
	if temp > max_temp:
		temp += ((temp - mid_temp) * 0.4) * delta
		GameStateManager.reduce_overload((20 + temp * 0.1) * delta)
	elif temp <= max_temp and temp > mid_temp:
		temp += (randf_range(18,25) - (temp - mid_temp) * 0.5) * delta
		GameStateManager.add_overload((15 + temp * 0.1) * delta)
	elif temp < mid_temp and temp >= min_temp:
		temp -= (randf_range(18,25) - (mid_temp - temp) * 0.5) * delta
		GameStateManager.add_overload((15 + temp * 0.1) * delta)
	elif temp < min_temp:
		temp -= ((mid_temp - temp) * 0.5) * delta
		GameStateManager.reduce_overload((20 + temp * 0.3) * delta)
		#add shacking
	else: #at mid_temp
		temp += randf_range(-5,5) * delta
	temp += randf_range(-0.3,0.3)
	if temp <= 0:
		temp = 0
	progress_bar.value = temp
	pass


func _on_sub_on_clicked():
	temp -= 5
	pass # Replace with function body.


func _on_add_on_clicked():
	temp += 5
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

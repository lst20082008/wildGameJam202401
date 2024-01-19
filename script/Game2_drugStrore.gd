extends GameSceneBase

@export var volume = 0
@export var target_vol = 30
@export var error_bar = 10
var is_selecting = false
var sin_val = 0
var temp_ol = 0
@onready var progress_bar_drug: ProgressBar = $ProgressBar_drug
@onready var progress_bar_volume: ProgressBar = $ProgressBar_volume

# Called when the node enters the scene tree for the first time.
func _ready():
	super()
	progress_bar_volume.visible = false
	progress_bar_drug.value = volume
	target_vol = randf_range(30,70)
	error_bar = randf_range(1,2)
	is_selecting = false
	print("Target range is: ", target_vol-error_bar," - ", target_vol+error_bar)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	GameStateManager.add_overload((10 + volume * 0.25) * delta)
	if progress_bar_volume.visible == true:
		sin_val += (1 + GameStateManager.overload * 0.035) * delta
		progress_bar_volume.value = absf(sin(sin_val) * 100)
	if volume <= 0:
		volume = 0
	progress_bar_drug.value = volume
	if volume <= target_vol + error_bar and volume >= target_vol - error_bar:
		victory()
	elif volume > target_vol + error_bar:
		loss()
	pass


func _on_sub_on_clicked():
	#temp -= 5
	pass # Replace with function body.


func _on_add_on_clicked():
	if not is_selecting:
		select_volume()
	else:
		adding_liquid()
	pass # Replace with function body.

func select_volume():
	progress_bar_volume.visible = true
	is_selecting = true

func adding_liquid():
	volume += progress_bar_volume.value * 0.2
	progress_bar_volume.value = 0
	sin_val = 0
	is_selecting = false
	progress_bar_volume.visible = false

func victory():
	super()
	print("wyyyyyyy")
	print("Final volume is:", volume)
	print("Overload value is:", GameStateManager.overload)
	SceneManager.to_next_scene()

func loss():
	GameStateManager.overload = GameStateManager.overload / 2
	print("you loss...")
	print("Overload value is:", GameStateManager.overload)
	SceneManager.to_next_scene()


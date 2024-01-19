extends GameSceneBase

@export var anger = 0
@onready var progress_bar: ProgressBar = $ProgressBar

# Called when the node enters the scene tree for the first time.
func _ready():
	super()
	progress_bar.value = anger
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	anger -= (50 - GameStateManager.overload * 0.15) * delta
	if anger <= 0:
		anger = 0
	GameStateManager.add_overload((10 + anger * 0.15) * delta)
	progress_bar.value = anger
	if anger >= 100:
		victory()
	pass


func _on_sub_on_clicked():
	#temp -= 5
	pass # Replace with function body.


func _on_add_on_clicked():
	anger += randf_range(5.0,20.0)
	pass # Replace with function body.
	
func victory():
	super()
	print("wyyyyyyy")
	print("Overload value is:", GameStateManager.overload)
	SceneManager.to_next_scene()


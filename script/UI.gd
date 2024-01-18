extends CanvasLayer

@onready var progress_bar: ProgressBar = $ProgressBar

func _ready():
	GameStateManager.ui = self

func update(overload):
	progress_bar.value = overload

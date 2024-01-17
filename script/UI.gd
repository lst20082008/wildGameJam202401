extends CanvasLayer

@onready var progress_bar: ProgressBar = $ProgressBar

func _ready():
	GameStateManager.ui = self

func update(overload: int):
	progress_bar.value = overload

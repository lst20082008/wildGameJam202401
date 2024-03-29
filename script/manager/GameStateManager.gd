extends Node

# 0-175 0-100 -> normal 100-175 -> overload
@onready var overload: float = 0
var clues: BitMap
@onready var cur_time: DayTime.DayTime = DayTime.DayTime.Morning
@onready var cur_day: int = 1
@onready var cur_pos: Place
@onready var last_overload: float = 0
# only used in night
@onready var visited_places: Array[Place] = []
@onready var ui = null
@onready var next_clues_can_get: Array[Clue] = []

func _ready():
	clues = BitMap.new()
	clues.create(Vector2i(DirAccess.get_files_at("res://resource/clue").size(), 1))
	# init clues
	for c in [0, 16]:
		clues.set_bit(c, 0, true)

func add_overload(n):
	overload += n
	if overload > 200:
		overload = 200
		print("too overload!")
	update_ui()

func reduce_overload(n):
	overload -= n
	if overload < 0:
		overload = 0
	update_ui()

func have_clue(n: int):
	return clues.get_bit(n, 0)

func get_clue(n: int):
	print("get clue:%d" %n)
	clues.set_bit(n, 0, true)

func get_all_clues() -> Array[int]:
	var ret: Array[int] = []
	for i in range(clues.get_size().x):
		if have_clue(i):
			ret.append(i)
	print("get all clues:")
	print(ret)
	return ret

func update_ui():
	if ui == null:
		return
	ui.update(overload)

func backup_before_game():
	last_overload = overload

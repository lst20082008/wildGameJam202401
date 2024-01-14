extends Node

# 0-175 0-100 -> normal 100-175 -> overload
@onready var overload: int = 0
# it need resize
@onready var clues: BitMap = BitMap.new()
@onready var cur_time: DayTime.DayTime = DayTime.DayTime.Morning
@onready var cur_day: int = 1
@onready var cur_pos: Place
@onready var last_overload: int = 0
# only used in night
@onready var visited_places: Array[Place] = []

func add_overload(n: int):
	overload += n
	if overload > 175:
		overload = 175
		print("too overload!")

func reduce_overload(n: int):
	overload -= n
	if overload < 0:
		overload = 0

func have_clue(n: int):
	return clues.get_bit(n, 0)

func get_clue(n: int):
	clues.set_bit(n, 0, true)

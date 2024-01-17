extends Node

@export var places: Array[Place]
@export var clues: Array[Clue]
	
func _ready():
	clues = []
	for clue in DirAccess.get_files_at("res://resource/clue"):
		if clue.get_extension() == "tres":
			clues.append(load("res://resource/clue/" + clue))
	places = []
	for place in DirAccess.get_files_at("res://resource/place"):
		if place.get_extension() == "tres":
			places.append(load("res://resource/place/" + place))
	# testcode
	_print_places()

func get_place(n: int):
	for place in places:
		if place.id == n:
			return place
	return null

# this will change places!!!
# this will effect game state!!!
func _print_clues():
	for clue in clues:
		if clue.get_from_place_id != -1:
			get_place(clue.get_from_place_id).clues.append(clue)
		else:
			print("推理："+clue.text)

func _print_places():
	for place in places:
		print(place.place_name + ":")
		for c in place.clues:
			print("    "+c.text)
			print("    "+ String.num_int64(c.id))

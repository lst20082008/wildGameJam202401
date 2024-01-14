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

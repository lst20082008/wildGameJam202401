class_name GameSceneBase
extends Node2D

var clues_can_get: Array[Clue] = []

func _ready():
	print("base ready")
	# get clues from game state manager
	clues_can_get = GameStateManager.next_clues_can_get

func victory():
	print("base victory")
	for c in clues_can_get:
		GameStateManager.get_clue(c.id)
	GameStateManager.next_clues_can_get = []

extends Resource
class_name Place

@export var id: int
@export var place_name: String
@export var position: Vector2
@export var clues: Array[Clue] = []
@export var next_scene: PackedScene
@export var open_type: PlaceType.PlaceType
@export var addtional_overload: int

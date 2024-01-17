extends Node2D

class_name MapScene

@export var day_map: Texture2D
@export var night_map: Texture2D
@onready var map_sprite: Sprite2D = $map_sprite
@onready var can_not_go: Array[int] = []
@onready var day_time: DayTime.DayTime = GameStateManager.cur_time

func _ready():
	$test.texture = ImageTexture.create_from_image(GameStateManager.clues.convert_to_image())
	if day_time == DayTime.DayTime.Morning:
		map_sprite.set_texture(day_map)
	else:
		map_sprite.set_texture(night_map)
	for place in ResourceManager.places:
		if not _place_can_go(place.id):
			can_not_go.append(place.id)
	

func _click_place(idx: int):
	if idx in can_not_go:
		return
	var place: Place = ResourceManager.get_place(idx)
	print("place be clicked:" + place.place_name)
	GameStateManager.add_overload(place.addtional_overload)
	get_tree().change_scene_to_packed(place.next_scene)
	pass

# return true if the place can go to
# else return false
func _place_can_go(idx: int):
	var place: Place = ResourceManager.get_place(idx)
	print("check place:" + place.place_name)
	if place in GameStateManager.visited_places:
		print("visited!")
		return false
	if place.open_type == PlaceType.PlaceType.Day and day_time != DayTime.DayTime.Morning:
		print("day place but night!")
		return false
	if place.open_type == PlaceType.PlaceType.Night and day_time != DayTime.DayTime.Evening:
		print("night place but day!")
		return false
	# check clues
	# if clues_all_find return false
	var clues_all_find = true
	for c in place.clues:
		if not GameStateManager.have_clue(c.id):
			clues_all_find = false
			return true
	if clues_all_find:
		print("clues all find")
		return false
	return true


func _on_cocoa_on_clicked():
	_click_place(0)
func _on_super_on_clicked():
	_click_place(1)
func _on_drug_store_on_clicked():
	_click_place(2)
func _on_big_hourse_on_clicked():
	_click_place(3)
func _on_bar_on_clicked():
	_click_place(4)
func _on_laobu_on_clicked():
	_click_place(5)
func _on_bojue_on_clicked():
	_click_place(6)
func _on_xiaomei_on_clicked():
	_click_place(7)
func _on_hotel_on_clicked():
	_click_place(8)

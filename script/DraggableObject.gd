extends Node2D
class_name DraggableObject

var mouse_click_on_me = false
var offset = null

func _process(delta):
	if not mouse_click_on_me:
		return

	if offset == null:
		offset = global_position - get_global_mouse_position()
	global_position = get_global_mouse_position() + offset


func _on_area_2d_mouse_entered():
	scale = Vector2(1.05, 1.05)

func _on_area_2d_mouse_exited():
	scale = Vector2(1, 1)

func setup_texture(texture):
	$Sprite2D.texture = texture

func set_mouse_click_on_me(b):
	mouse_click_on_me = b
	if b == false:
		offset = null

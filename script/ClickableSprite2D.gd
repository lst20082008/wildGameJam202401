extends Sprite2D
class_name ClickableSprite2D

signal on_clicked()

func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		if get_rect().has_point(to_local(event.position)):
			on_clicked.emit()

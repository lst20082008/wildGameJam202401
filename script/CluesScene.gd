extends Node2D

@onready var desk_line = $Line2D
@export var img_width: float
@export var img_height: float
@onready var clue_template: PackedScene = preload("res://scene/draggable_object.tscn")
var top_node = null

func _process(delta):
	if Input.is_action_just_pressed("click"):
		# detect
		var pos = get_global_mouse_position()
		var ppqp = PhysicsPointQueryParameters2D.new()
		ppqp.position = pos
		ppqp.collide_with_areas = true
		ppqp.collide_with_bodies = false
		var intersects = get_world_2d().get_direct_space_state().intersect_point(ppqp)
		var top_z = -1
		var top_c = null
		for i in intersects:
			if i.collider.z_index > top_z:
				top_z = i.collider.z_index
				top_c = i.collider
		if top_c:
			top_node = top_c.get_parent()
			print(top_node)
			top_node.set_mouse_click_on_me(true)
	elif Input.is_action_just_released("click"):
		print("release click")
		print(top_node)
		if top_node:
			top_node.set_mouse_click_on_me(false)
			top_node = null

func _ready():
	var top_left = desk_line.get_point_position(0)
	var bot_right = desk_line.get_point_position(1)
	for c in GameStateManager.get_all_clues():
		var sprite = clue_template.instantiate()
		sprite.add_to_group("clue_image")
		sprite.setup_texture(ResourceManager.get_clue(c).img)
		sprite.position = _get_gen_pos(top_left, bot_right, img_width, img_height)
		add_child(sprite)
		pass

# anchor of the sprite should be top_left
func _get_gen_pos(top_left: Vector2, bot_right: Vector2, width, height):
	# no room for sprite
	if bot_right.x - top_left.x < width or bot_right.y - top_left.y < height:
		return Vector2(-1, -1)
	var x = randf_range(top_left.x, bot_right.x - width)
	var y = randf_range(top_left.y, bot_right.y - height)
	return Vector2(x, y)

extends CharacterBody2D

var speed: float = 200.0
var mouse_position: Vector2 # Modified by _input()

func _physics_process(delta: float) -> void:
	_process_movement(delta)
	_process_rotation()
	

func _process_movement(delta: float) -> void:
	# Moving, normalized
	var input_vector := Vector2.ZERO
	if Input.is_action_pressed("move_up"):
		input_vector.y -= 1
	if Input.is_action_pressed("move_down"):
		input_vector.y += 1
	if Input.is_action_pressed("move_left"):
		input_vector.x -= 1
	if Input.is_action_pressed("move_right"):
		input_vector.x += 1
	input_vector = input_vector.normalized()
	position += input_vector * speed * delta
	

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		mouse_position = event.position
	

func _process_rotation():
	look_at(mouse_position)
	rotation_degrees += 90
	

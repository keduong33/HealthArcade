class_name Running extends PlayerState

func enter(_previous_state_path: String, _data:={}) -> void:
	pass

func physics_update(_delta: float) -> void:
	var input_direction := Input.get_vector("move_left", "move_right", "move_up", "move_down")

	if input_direction.x > 0:
		player.animated_sprite.flip_h = false
		player.weapon.rotation_degrees = 0
	elif input_direction.x < 0:
		player.animated_sprite.flip_h = true
		player.weapon.rotation_degrees = -180

	player.velocity = input_direction * player.speed
	player.move_and_slide()

	if Input.is_action_just_pressed("attack"):
		finished.emit(ATTACKING)
	elif player.velocity == Vector2.ZERO:
		finished.emit(IDLE)

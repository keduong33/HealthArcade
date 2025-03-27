class_name Attacking extends PlayerState

func enter(_previous_state_path: String, _data:={}) -> void:
	player.velocity = Vector2.ZERO

func physics_update(_delta: float) -> void:
	player.attack(!player.animated_sprite.flip_h)

	if Input.is_action_just_released("attack"):
		finished.emit(IDLE)
	elif Input.is_action_pressed("move_up") \
		or Input.is_action_pressed("move_down") \
		or Input.is_action_pressed("move_left") \
		or Input.is_action_pressed("move_right"):
			finished.emit(RUNNING)
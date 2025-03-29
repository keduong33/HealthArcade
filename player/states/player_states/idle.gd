class_name Idle extends PlayerState

func enter(_previous_state_path: String, _data:={}) -> void:
	player.velocity = Vector2.ZERO

func physics_update(_delta: float) -> void:
	if Input.get_vector("move_left", "move_right", "move_up", "move_down") != Vector2.ZERO:
			finished.emit(RUNNING)
	elif Input.is_action_just_pressed("attack"):
		finished.emit(ATTACKING)

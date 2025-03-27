class_name Attacking extends PlayerState

func enter(_previous_state_path: String, _data:={}) -> void:
	player.velocity = Vector2.ZERO
	player.attack()
	player.attack_timer.start()

func physics_update(_delta: float) -> void:
	if player.attack_timer.time_left > 0:
		return
		
	if Input.is_action_just_pressed("attack"):
		finished.emit(IDLE)
	elif Input.is_action_pressed("move_up") \
		or Input.is_action_pressed("move_down") \
		or Input.is_action_pressed("move_left") \
		or Input.is_action_pressed("move_right"):
			finished.emit(RUNNING)

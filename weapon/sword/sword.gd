class_name Sword extends Weapon

func get_modified(health_state: Player.HealthState) -> void:
	super (health_state)

	match health_state:
		Player.HealthState.HEALTHY:
			damage = 10.0
			attack_speed = 0.3
			
		Player.HealthState.INJURED:
			damage = 5.0
			attack_speed = 0.5

		Player.HealthState.CRITICAL:
			damage = 2.0
			attack_speed = 0.7

class_name Weapon extends Area2D

@export var damage: float = 10.0
@export var attack_speed: float = 0.3

@onready
var healthy_attack_range: CollisionShape2D = $HealthyAttackRange

@onready
var injured_attack_range: CollisionShape2D = $InjuredAttackRange

@onready
var critical_attack_range: CollisionShape2D = $CriticalAttackRange

var current_attack_range: CollisionShape2D


func _ready() -> void:
	current_attack_range = healthy_attack_range
	print('Current attack range:', current_attack_range.name)
	current_attack_range.disabled = true

func get_modified(health_state: Player.HealthState) -> void:
	current_attack_range.disabled = true
	change_weapon_range(health_state)

func set_enabled(enabled: bool):
	current_attack_range.disabled = !enabled

func change_weapon_range(_health_state: Player.HealthState) -> void:
	match _health_state:
		Player.HealthState.HEALTHY:
			current_attack_range = healthy_attack_range
		Player.HealthState.INJURED:
			current_attack_range = injured_attack_range
		Player.HealthState.CRITICAL:
			current_attack_range = critical_attack_range
	# Ensure the current attack range is disabled
	current_attack_range.disabled = true
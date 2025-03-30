class_name Player extends CharacterBody2D

@export var speed: float = 500.0
@export var attackSpeed: float = 0.3
@export var health: int = 100


## Change this later to Weapon
@onready
var weapon: Weapon = $Sword

@onready
var animated_sprite: Sprite2D = $Sprite2D

@onready
var attack_timer: Timer = $AttackTimer

enum HealthState {
	HEALTHY,
	INJURED,
	CRITICAL
	}

@onready
var current_health_state: HealthState = HealthState.HEALTHY

func _ready():
	attack_timer.wait_time = attackSpeed

# Testing purpose
func _physics_process(_delta: float) -> void:
	if Input.is_action_just_pressed("add_health"):
		health += 10
	elif Input.is_action_just_pressed("remove_health"):
		health -= 10

	var new_health_state = get_health_state()
	if current_health_state != new_health_state:
		current_health_state = new_health_state
		weapon.get_modified(current_health_state)

func attack():
	weapon.set_enabled(true)
	await attack_timer.timeout
	weapon.set_enabled(false)

func get_health_state() -> HealthState:
	if health > 90:
		return HealthState.HEALTHY
	elif health > 80:
		return HealthState.INJURED
	else:
		return HealthState.CRITICAL

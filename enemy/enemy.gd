class_name Enemy extends CharacterBody2D

@export var speed: float = 100.0
@export var attack_speed: float = 0.3

@onready
var player: Player = get_parent().get_node("Player")

var sprite: AnimatedSprite2D

var knock_back: Vector2 = Vector2.ZERO

@export
var knock_back_recovery: float = 20;
@export
var knock_back_speed: float = 300;

func _ready():
	pass

func _physics_process(_delta: float) -> void:
	var direction = position.direction_to(player.position)
	sprite.flip_h = direction.x < 0
	velocity = direction * speed + knock_back

	var collision = move_and_slide()

	if collision:
		knock_back = - position.direction_to(player.position) * knock_back_speed

	knock_back = knock_back.move_toward(Vector2.ZERO, knock_back_recovery)

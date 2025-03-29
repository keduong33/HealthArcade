class_name Enemy extends CharacterBody2D

@export var speed: float = 100.0
@export var attackSpeed: float = 0.3

@onready
var player: Player = get_parent().get_node("Player")

var sprite: AnimatedSprite2D

var knockback: Vector2 = Vector2.ZERO

@export
var knockBackRecovery: float = 20;
@export
var knockBackSpeed: float = 300;

func _ready():
	pass

func _physics_process(_delta: float) -> void:
	var direction = position.direction_to(player.position)
	sprite.flip_h = direction.x < 0
	velocity = direction * speed + knockback

	var collision = move_and_slide()

	if collision:
		knockback = - position.direction_to(player.position) * knockBackSpeed

	knockback = knockback.move_toward(Vector2.ZERO, knockBackRecovery)

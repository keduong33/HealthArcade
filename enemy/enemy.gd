class_name Enemy extends CharacterBody2D

@export var speed: float = 500.0
@export var attackSpeed: float = 0.3

@onready
var animated_sprite: Sprite2D = $Sprite2D

@onready
var attack_timer: Timer = $AttackTimer

func _ready():
	pass

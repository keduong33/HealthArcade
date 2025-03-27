class_name Player extends CharacterBody2D

@export var speed: float = 500.0
@export var attackSpeed: float = 0.3

@onready
var animated_sprite: Sprite2D = $Sprite2D

@onready
var attack_range: Area2D = $AttackRange

@onready
var attack_timer: Timer = $AttackTimer

func _ready():
	attack_timer.wait_time = attackSpeed

func attack():
	$AttackRange/CollisionShape2D.disabled = false
	await attack_timer.timeout
	$AttackRange/CollisionShape2D.disabled = true

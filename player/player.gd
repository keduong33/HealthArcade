class_name Player extends CharacterBody2D

@export var speed: float = 500.0

@onready
var animated_sprite: Sprite2D = $Sprite2D

func _ready():
	pass

func attack(isRightSide: bool):
	if isRightSide:
		$AttackRange/Right.visible = true
		$AttackRange/Right/CollisionShape2D.disabled = false

		$AttackRange/Left/CollisionShape2D.disabled = true
		$AttackRange/Left.visible = false
	else:
		$AttackRange/Left.visible = true
		$AttackRange/Left/CollisionShape2D.disabled = false

		$AttackRange/Right.visible = false
		$AttackRange/Right/CollisionShape2D.disabled = true

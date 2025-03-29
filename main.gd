extends Node

@onready var flying_eye_scene = preload("res://enemy/flying_eye/flying_eye.tscn")


func _ready() -> void:
	pass

func _physics_process(_delta: float) -> void:
	if (get_child_count() < 11):
		spawnEnemy()

func spawnEnemy():
	var rng = RandomNumberGenerator.new()
	var rndX = rng.randf_range(20, get_viewport().get_visible_rect().size.x - 10)
	var rndY = rng.randf_range(10, get_viewport().get_visible_rect().size.y - 10)
	var enemy: Node2D = flying_eye_scene.instantiate()
	add_child(enemy)
	enemy.position = Vector2(rndX, rndY);
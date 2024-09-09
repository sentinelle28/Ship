extends Node

class_name HealthComponent
@export var max_health:int = 3
@onready var current_health:int = max_health
@export var health_regeneration:int = 0

func take_dmg(dmg:int)->void:
	current_health -= dmg
	if current_health <= 0:
		get_parent().queue_free()

func _regen():
	pass

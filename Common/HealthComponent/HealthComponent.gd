extends Node

class_name HealthComponent
@export var max_health:int = 3
@onready var current_health:int = max_health
@export var health_regeneration:int = 0

func _take_dmg(dmg:int)->void:
	current_health -= dmg
	if current_health <= 0:
		get_parent().queue_free()

func _regen()->void:
	pass

func _modify_max_health(new_max_healht:int)->void:
	if new_max_healht < current_health:
		current_health = new_max_healht
	max_health = new_max_healht

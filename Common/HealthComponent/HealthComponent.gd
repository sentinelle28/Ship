extends Node

class_name HealthComponent
@export var max_health:int = 3
@onready var current_health:int = max_health
@onready var label:Label = $"../Label"

@export var health_regeneration:int = 0
@export var timer:Timer


func _ready() -> void:
	timer.start(3)

func _take_dmg(dmg:int)->void:
	current_health -= dmg
	if current_health <= 0:
		var day:Day = get_tree().current_scene.get_node("Day")
		get_tree().paused = true
		DeathLayer._update_the_value(get_parent().money,day.day_number)

func _regen()->void:
	current_health += health_regeneration
	if current_health > max_health:
		current_health = max_health

func _modify_max_health(new_max_healht:int)->void:
	if new_max_healht < current_health:
		current_health = new_max_healht
	max_health = new_max_healht


func _on_timer_timeout() -> void:
	_regen()
	timer.start(3)

func _process(_delta: float) -> void:
	label.text = str(current_health) + "/" + str(max_health)

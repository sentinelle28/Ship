extends Node

class_name Day
var duration:int = 60
@export var player:Player

func _ready() -> void:
	$Timer.wait_time = duration

func _process(_delta: float) -> void:
	if $Timer.time_left/duration < 0.2:
		pass

func _spawn_thunder()->void:
	pass
	
func _darken()->void:
	pass
	

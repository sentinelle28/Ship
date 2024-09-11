extends Node

class_name Day
var day_number:int = 1
var duration:int = 60
@export var player:Player
@export var thunder_prefab:PackedScene

func _ready() -> void:
	$Timer.wait_time = duration

func _process(_delta: float) -> void:
	var percent_left = $Timer.time_left/duration
	if percent_left < 0.2 and percent_left >= 0:
		_spawn_thunder()

func _spawn_thunder()->void:
	var vector:Vector2 = Vector2(randf_range(-1,1),randf_range(-1,1))
	var child:AnimatedSprite2D = thunder_prefab.instantiate()
	child.global_position = player.global_position + vector*100*($Timer.time_left/duration)
	add_child(child)
	await get_tree().create_timer(0.4).timeout
	remove_child(child)
	
func _darken()->void:
	var tween:Tween = get_tree().create_tween()
	var tween_2:Tween = get_tree().create_tween()
	tween.tween_property($CanvasModulate,"color",Color.BLACK,duration)
	tween_2.tween_property(player.light,"scale",Vector2(1,1),duration)

func _rest()->void:
	_reset()
	_change_duration()
	day_number += 1

func _reset()->void:
	$CanvasModulate.color = Color.WHITE
	player.light.scale = Vector2(8.984,5.023)

func _change_duration()->void:
	duration += randi_range(-5,5)
	if duration < 30:
		duration = 30
	$Timer.start(duration)

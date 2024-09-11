extends CanvasLayer

func _update_the_value(money:int,day:int)->void:
	show()
	$money/player_money.text = str(money)
	$day/current_day.text = str(day)
	
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("retry"):
		hide()
		get_tree().paused = false
		get_tree().reload_current_scene()

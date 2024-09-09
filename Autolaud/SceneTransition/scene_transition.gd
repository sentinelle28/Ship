extends CanvasLayer


func _change_scene(scene_to_change:String):
	show()
	$AnimationPlayer.play("Transition")
	await get_tree().create_timer(1.2).timeout
	get_tree().change_scene_to_file(scene_to_change)
	await get_tree().create_timer(0.8).timeout
	hide()
	

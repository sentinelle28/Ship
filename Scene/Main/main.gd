extends Node2D



func _on_play_pressed():
	SceneTransition._change_scene("res://Scene/GameplayScene/gameplay_scene.tscn")




func _on_quit_pressed():
	get_tree().quit()


func _on_credits_pressed():
	SceneTransition._change_scene("res://Scene/CreditScene/Credit.tscn")


func _on_tutorial_pressed():
	SceneTransition._change_scene("res://Scene/Tutorial/Tutorial.tscn")


func _on_settings_pressed():
	SceneTransition._change_scene("res://Scene/OptionScene/Option.tscn")

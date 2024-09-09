extends Node2D

@export var LastOpenTab:Button 



func _on_audio_pressed()->void:
	_change_tab($Audio)

func _change_tab(CurrentTab:Button)->void:
	if LastOpenTab != CurrentTab:
		for child in LastOpenTab.get_children():
			child.hide()
		
		for child in CurrentTab.get_children():
			child.show()


func _on_main_music_slider_drag_ended(value_changed:int)->void:
	Settings._change_main_volume(value_changed)


func _on_sound_effect_slider_drag_ended(value_changed:int)->void:
	Settings._change_sfx_volume(value_changed)

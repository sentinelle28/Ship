extends Node

var MainMusicVolume:int = 100
var SoundEffectVolume:int = 100

func _change_main_volume(NewVolume:int)->void:
	MainMusicVolume = NewVolume
	MainMusic._change_sound(NewVolume)

func _change_sfx_volume(NewVolume:int)->void:
	SoundEffectVolume = NewVolume
	

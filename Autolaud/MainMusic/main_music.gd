extends AudioStreamPlayer


func _play():
	play(0)
	
func _change_sound(volume:int)->void:
	volume_db = -(100-volume)

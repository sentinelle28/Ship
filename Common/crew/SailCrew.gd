extends Crew

class_name SailCrew
@export var bonus_to_speed:int = 0
@export var bonus_to_regeneration:int = 0
@export var bonus_to_max_health:int = 0

func _return_pros()->Dictionary:
	var dict:Dictionary
	dict["bonus_to_speed"] = bonus_to_speed
	dict["bonus_to_regeneration"] = bonus_to_regeneration
	dict["bonus_to_max_health"] = bonus_to_max_health
	return dict

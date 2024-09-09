extends Node

class_name PlayerInput
@export var InputName:String
@export var CanUseInput:bool = true
@export var MustBePressed:bool = false

func _get_input_pressed()->bool:
	"""  Return a true if the player perfomed the action and has permission"""
	if MustBePressed:
		return Input.is_action_pressed(InputName) and CanUseInput
	else:
		return Input.is_action_just_pressed(InputName) and CanUseInput
	
func _get_input_release()->bool:
	"""  Return a true if the player released the action and has permission"""
	return Input.is_action_just_released(InputName) and CanUseInput
	
func _change_access(NewAccess:bool)->void:
	""" Change the Permission of the player on this input"""
	CanUseInput = NewAccess
	
func _change_mode(NewMod:bool)->void:
	""" Change the Mode of input between :
		true -> pressed
		false -> just_pressed
	 of the player on this input"""
	MustBePressed = NewMod
	

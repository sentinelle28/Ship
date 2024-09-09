extends Node

var InputDict:Dictionary = {}

func _get_input(InputName:String)->bool:
	""" Get the Input if possible
	Arg:
		InputName:string -> name of the input
	return:
		bool -> If the player pressed and has permission then true  """
	return InputDict[InputName]._get_input_pressed()
	
func _get_axis(InputArray:Array[String])->int:
	"""   Get the player Movement of an axis
	Arg:
		InputArray:Array[String] -> len() == 2 because it is an axis
	Return:
		int: the new direction
	"""
	
	if InputDict[InputArray[0]]._get_input_pressed() and InputDict[InputArray[1]]._get_input_pressed():
		return 0
	elif InputDict[InputArray[0]]._get_input_pressed():
		return -1
	elif InputDict[InputArray[1]]._get_input_pressed():
		return 1
	else:
		return 0
	
func _get_vector(InputArray:Array[String])->Vector2:
	""" Return the vector corresponding to the movement of the player
	Arg:
		InputArray:Array[String] -> len() == 4 because we want a vector
	Return:
		Vector2 -> the direction vector
	
	"""
	return Vector2(_get_axis([InputArray[0],InputArray[1]]),_get_axis([InputArray[2],InputArray[3]]))
	

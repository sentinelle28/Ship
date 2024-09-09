extends Node2D

@export var Text:String = ""
@export var LabelPrefab:PackedScene
@export var Mult:int = 30
@export var AutoPanel:Panel
@export var SPEED:int = 3
var shift:float = 0
var Offset:int

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _ready()->void:
	_update_offset()
	for i in len(Text):
		var NewLabel:Label = LabelPrefab.instantiate()
		NewLabel.text = Text[i]
		NewLabel.position = Vector2(i*Mult + Offset,0)
		add_child(NewLabel)
	AutoPanel.scale.x = (len(Text)*Mult+10)/AutoPanel.size.x
	AutoPanel.position.x = -(AutoPanel.size.x*AutoPanel.scale.x)/2 - 5


func _process(delta:float)->void:
	shift += delta * SPEED
	for i:int in range(get_child_count()):
		if not get_child(i) is Panel:
			var new_i:int = i - 1 #caused of panel child
			get_child(i).position = Vector2(new_i*Mult + Offset,sin(new_i*Mult + Offset + shift)*2)

func _update_offset()->void:
	Offset = -int(len(Text)/2) * Mult

extends Node2D


class_name DecoyCrew
var object:Crew
var path:String 
var current_haibor:Hairbor
var player:Player

func _assign_object(new_object:String)->void:
	object = CrewPossible.crew[new_object]
	path = new_object
	_update_texure()

func _on_sell_button_pressed() -> void:
	HairborLayer._sell_item(path)
	_update_tag(current_haibor,player)

func _on_buy_button_pressed() -> void:
	HairborLayer._buy_item(path)
	_update_tag(current_haibor,player)

func _update_tag(hairbor:Hairbor,players:Player)->void:
	$in_hairbor.text = str(hairbor.check_crew(path))
	$on_ship.text = str(players.check_stock(path))
	current_haibor = hairbor
	player = players

func _update_texure()->void:
	var child:Sprite2D = Sprite2D.new()
	child.texture = object.get_node("Sprite2D").texture
	add_child(child)

extends Node2D

class_name DecoyObject
var object:ObjectToSell
var path:String 
var current_haibor:Hairbor
var player:Player

func _assign_object(new_object:String)->void:
	object = ItemPossible.item[new_object]
	path = new_object

func _on_sell_button_pressed() -> void:
	HairborLayer._sell_item(path)
	
	_update_tag(current_haibor,player)

func _on_buy_button_pressed() -> void:
	HairborLayer._buy_item(path)
	
	_update_tag(current_haibor,player)

func _update_tag(hairbor:Hairbor,players:Player)->void:
	$hairbor_stock.text = str(hairbor.check_stock(path))
	$player_stock.text = str(players.check_stock(path))
	current_haibor = hairbor
	player = players

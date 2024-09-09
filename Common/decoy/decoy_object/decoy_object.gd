extends Node2D

var object:ObjectToSell

func _assign_object(new_object:ObjectToSell)->void:
	object = new_object

func _on_sell_button_pressed() -> void:
	HairborLayer._sell_item(object)

func _on_buy_button_pressed() -> void:
	HairborLayer._buy_item(object)

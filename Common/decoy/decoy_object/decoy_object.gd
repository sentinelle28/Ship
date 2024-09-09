extends Node2D

class_name DecoyObject
var object:ObjectToSell

func _assign_object(new_object:ObjectToSell)->void:
	object = new_object

func _on_sell_button_pressed() -> void:
	HairborLayer._sell_item(object)

func _on_buy_button_pressed() -> void:
	HairborLayer._buy_item(object)

func _update_tag(hairbor:Hairbor,player:Player)->void:
	$hairbor_stock.text = str(hairbor.check_stock(object.name))
	$player_stock.text = str(player.check_stock(object.name))

func _update_texture(texture:Texture2D)->void:
	var new_child:Sprite2D = Sprite2D.new()
	new_child.texture = texture
	add_child(new_child)

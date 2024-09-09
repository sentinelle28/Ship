extends CanvasLayer

@onready var go_button:Button = $go_button
@export var decoy_item:PackedScene
var current_hairbor:Hairbor
var players:Player

func _show_menu(hairbor:Hairbor,player:Player)->void:
	current_hairbor = hairbor
	show()
	_update_money(player.money)
	players = player

func _update_money(money:int)->void:
	$Label.text = str(money)

func _sell_item(item:ObjectToSell)->void:
	current_hairbor._sell_item(item)

func _buy_item(item:ObjectToSell)->void:
	current_hairbor._buy_item(item)

func _show_item()->void:
	var list_already_spawn:Array[String] = []
	var new_list:Array = Array(current_hairbor.stock_list.keys())
	#player stock
	for elt:ObjectToSell in players.thing_on_board:
		if elt.name in list_already_spawn:
			list_already_spawn.append(elt.name)
			var new_child:DecoyObject = decoy_item.instantiate()
			new_child._update_tag(current_hairbor,players)
			new_child._update_texture(elt.texture)
			add_child(new_child)
		
	#hairbor stock
	for elt:ObjectToSell in new_list:
		if elt.name in list_already_spawn:
			list_already_spawn.append(elt.name)
			var new_child:DecoyObject = decoy_item.instantiate()
			new_child._update_tag(current_hairbor,players)
			new_child._update_texture(elt.texture)
			add_child(new_child)

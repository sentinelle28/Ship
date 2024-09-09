extends CanvasLayer

@onready var go_button:Button = $go_button
var current_hairbor:Hairbor

func _show_menu(hairbor:Hairbor,player:Player)->void:
	current_hairbor = hairbor
	show()
	_update_money(player.money)

func _update_money(money:int)->void:
	$Label.text = str(money)

func _sell_item(item:ObjectToSell)->void:
	current_hairbor._sell_item(item)

func _buy_item(item:ObjectToSell)->void:
	current_hairbor._buy_item(item)

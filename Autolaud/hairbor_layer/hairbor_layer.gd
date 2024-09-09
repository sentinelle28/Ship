extends CanvasLayer

@onready var go_button:Button = $go_button


func _show_menu(hairbor:Hairbor,player:Player)->void:
	show()
	_update_money(player.money)

func _update_money(money:int)->void:
	$Label.text = str(money)

extends Area2D

class_name Hairbor
var price_list:Dictionary = {}
var stock_list:Dictionary = {}
var hirable_crew:Array[Crew] = []
var player:Player
 
func _ready() -> void:
	HairborLayer.go_button.connect("pressed",_close_menu)
	
func _open_menu()->void:
	HairborLayer._show_menu(self,player)
	player._enter_an_haibor()
	
func _close_menu()->void:
	HairborLayer.hide()
	player.is_in_a_hairbor = false


func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		player = body
		_open_menu()

func _sell_item(item:ObjectToSell)->void:
	if player.in_stock(item.name):
		player._sell_item(item,price_list[item.name])
	
func _buy_item(item:ObjectToSell)->void:
	if player.is_there_space_left(item.capacity) and stock_list[item.name] > 0:
		player._buy_item(item,price_list[item.name])

func check_stock(name_of_the_object:String)->int:
	return stock_list[name_of_the_object]

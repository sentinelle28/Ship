extends Area2D

class_name Hairbor
var price_list:Dictionary = {}
var stock_list:Dictionary = {}
var hirable_crew:Dictionary = {}
var player:Player
 
func _ready() -> void:
	HairborLayer.go_button.connect("pressed",_close_menu)
	for object:String in ItemPossible.item.keys():
		#object dans le stock list
		stock_list[object] = 1
		price_list[object] = 10
	
	for object:String in CrewPossible.crew.keys():
		#object dans le stock list
		hirable_crew[object] = 1
	
	
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

func _sell_item(item:String)->void:
	if player.in_stock(item):
		player._sell_item(item,price_list[item])
	
func _buy_item(item:String)->void:
	if player.is_there_space_left(ItemPossible.item[item].capacity) and stock_list[item] > 0:
		player._buy_item(item,price_list[item])
		stock_list[item] -= 1

func check_stock(name_of_the_object:String)->int:
	return stock_list[name_of_the_object]

func check_crew(name_of_the_object:String)->int:
	return hirable_crew[name_of_the_object]

func _hire_crew(item:String)->void:
	if player.is_there_space_left(CrewPossible.crew[item].capacity) and hirable_crew[item] > 0:
		player._add_crewmate(item)
		hirable_crew[item] -= 1

func _eject_crew(item:String)->void:
	player._remove_crewmate(item)
	hirable_crew[item] += 1

func _rest()->void:
	for elt:String in stock_list:
		stock_list[elt] = randi_range(1,5)

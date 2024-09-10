extends CanvasLayer

@onready var go_button:Button = $go_button
@export var decoy_item:PackedScene
@export var decoy_crew:PackedScene
var current_hairbor:Hairbor
var players:Player
var absolute_child:Array[Node]

func _ready() -> void:
	for child in get_children():
		absolute_child.append(child)

func _show_menu(hairbor:Hairbor,player:Player)->void:
	current_hairbor = hairbor
	players = player
	show()
	_update_money(player.money)
	_open_crew_menu()

func _update_money(money:int)->void:
	$Label.text = str(money)

func _sell_item(item:String)->void:
	current_hairbor._sell_item(item)
	_update_money(players.money)

func _buy_item(item:String)->void:
	current_hairbor._buy_item(item)
	_update_money(players.money)

func _show_item()->void:
	var list_already_spawn:Array[String] = []
	var new_list:Array = Array(current_hairbor.stock_list.keys())
	var last_pos:int = 100
	#player stock
	for path:String in players.thing_on_board:
		if not path in list_already_spawn:
			list_already_spawn.append(path)
			var new_child:DecoyObject = decoy_item.instantiate()
			new_child._assign_object(path)
			new_child._update_tag(current_hairbor,players)
			add_child(new_child)
			new_child.global_position = Vector2(100,last_pos)
			last_pos += 100
		
	#hairbor stock
	for path:String in new_list:
		if not path in list_already_spawn:
			
			#no repeat
			list_already_spawn.append(path)
			#create new child
			var new_child:DecoyObject = decoy_item.instantiate()
			#option
			new_child._assign_object(path)
			new_child._update_tag(current_hairbor,players)
			new_child.global_position = Vector2(100,last_pos)
			last_pos += 100
			add_child(new_child)
			
func _open_item_menu()->void:
	_erase_other_child()
	_show_item()

func _erase_other_child()->void:
	for child in get_children():
		if not child in absolute_child:
			remove_child(child)
			
func _open_crew_menu()->void:
	_erase_other_child()
	_show_crew()
	
func _show_crew()->void:
	var list_already_spawn:Array[String] = []
	var new_list:Array = Array(current_hairbor.hirable_crew.keys())
	var last_pos:int = 100
	#player stock
	for path:String in players.crew:
		if not path in list_already_spawn:
			list_already_spawn.append(path)
			var new_child:DecoyCrew = decoy_crew.instantiate()
			new_child._assign_object(path)
			new_child._update_tag(current_hairbor,players)
			add_child(new_child)
			new_child.global_position = Vector2(100,last_pos)
			last_pos += 100
		
	#hairbor stock
	for path:String in new_list:
		if not path in list_already_spawn:
			
			#no repeat
			list_already_spawn.append(path)
			#create new child
			var new_child:DecoyCrew = decoy_crew.instantiate()
			#option
			new_child._assign_object(path)
			new_child._update_tag(current_hairbor,players)
			new_child.global_position = Vector2(100,last_pos)
			last_pos += 100
			add_child(new_child)

func _hire_crew(item:String)->void:
	current_hairbor._hire_crew(item)
	_update_money(players.money)

func _eject_crew(item:String)->void:
	current_hairbor._eject_crew(item)

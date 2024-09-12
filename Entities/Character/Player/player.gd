extends CharacterBody2D

class_name Player

@export var hairbor_array:Array[Hairbor] = []

#day class
@onready var light:PointLight2D = $PointLight2D

@export var label_prefap:PackedScene 
var hairbor_tool:Dictionary = {}


var is_in_a_hairbor:bool = false
var speed:int = 100
@onready var healthcomponent:HealthComponent = $HealthComponent
var money:int = 100
var capacity:int = 0
var max_capacity:int = 10

var thing_on_board:Array[String] = []
var crew:Array[String] = []

func _ready() -> void:
	_init_tools()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if !is_in_a_hairbor:
		_move(delta)

func _move(delta:float)->void:
	var direction:Vector2 = Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	_change_direction(direction)
	if direction != Vector2.ZERO:
		velocity = direction*speed
	else:
		velocity.x = lerp(velocity.x,0.0,delta)
		velocity.y = lerp(velocity.y,0.0,delta)
	move_and_slide()
	
func _change_direction(direction:Vector2)->void:
	if direction.x != 0:
		$AnimatedSprite2D.flip_h = direction.x > 0

func is_there_space_left(cost:int)->bool:
	return cost + capacity <= max_capacity
	
func _remove_crewmate(item:String)->void:
	var crewmate:Crew = CrewPossible.crew[item]
	if crewmate is SailCrew:
		var temp_dict:Dictionary = crewmate._return_pros()
		for modif in temp_dict.keys():
			if temp_dict[modif] != 0:
				if modif == "bonus_to_speed":
					speed -= temp_dict[modif]
				elif modif == "bonus_to_regeneration":
					healthcomponent.health_regeneration -= temp_dict[modif]
				elif modif == "bonus_to_max_health":
					healthcomponent._modify_max_health(temp_dict[modif])
	capacity -= crewmate.capacity
	crew.erase(item)
	

func _add_crewmate(item:String)->void:
	var crewmate:Crew = CrewPossible.crew[item]
	if is_there_space_left(crewmate.capacity):
		if crewmate is SailCrew:
			var temp_dict:Dictionary = crewmate._return_pros()
			for modif in temp_dict.keys():
				if temp_dict[modif] != 0:
					if modif == "bonus_to_speed":
						speed += temp_dict[modif]
					elif modif == "bonus_to_regeneration":
						healthcomponent.health_regeneration += temp_dict[modif]
					elif modif == "bonus_to_max_health":
						healthcomponent._modify_max_health(temp_dict[modif])
		crew.append(item)
		capacity += crewmate.capacity

func _enter_an_haibor()->void:
	is_in_a_hairbor = true
	velocity = Vector2.ZERO

func _sell_item(item:String,price:int)->void:
	capacity -= ItemPossible.item[item].capacity
	money += price
	thing_on_board.erase(item)
	
func _buy_item(item:String,price:int)->void:
	capacity += ItemPossible.item[item].capacity
	money -= price
	thing_on_board.append(item)

func in_stock(item_name:String)->bool:
	return check_stock(item_name) > 0

func check_stock(name_of_the_object:String)->int:
	var stock_nb:int = 0
	for elt in thing_on_board:
		if elt == name_of_the_object:
			stock_nb +=1
	return stock_nb

func check_crew(name_of_the_object:String)->int:
	var stock_nb:int = 0
	for elt in crew:
		if elt == name_of_the_object:
			stock_nb +=1
	return stock_nb

func _show_hairbor()->void:
	for hairbor:Hairbor in hairbor_array:
		var direction:Vector2 = global_position.direction_to(hairbor.global_position)
		#on the circle of lenght 10
		hairbor_tool[hairbor.name].global_position = global_position + direction * 10
	
func _take_dmg(dmg:int)->void:
	healthcomponent._take_dmg(dmg)

func _init_tools()->void:
	for haibor:Hairbor in hairbor_array:
		var new_child:Label = label_prefap.instantiate()
		new_child.text = haibor.name
		add_child(new_child)
		new_child.hide()
		hairbor_tool[haibor.name]= new_child

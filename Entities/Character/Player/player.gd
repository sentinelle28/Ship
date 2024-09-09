extends CharacterBody2D

var speed:int = 10000
var current_health:int = 3
var max_health:int = 3
var health_regeneration:int = 0
var money:int = 100

var thing_on_board:Array[ObjectToSell] = []
var crew:Array[Crew] = []

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	_move(delta)

func _move(delta:float)->void:
	var direction:Vector2 = Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	_change_direction(direction)
	if direction != Vector2.ZERO:
		velocity = direction*speed*delta
	else:
		velocity.x = lerp(velocity.x,0.0,delta)
		velocity.y = lerp(velocity.y,0.0,delta)
	move_and_slide()
		

func _change_direction(direction:Vector2)->void:
	if direction.x != 0:
		$AnimatedSprite2D.flip_h = direction.x > 0

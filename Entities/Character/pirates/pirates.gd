extends CharacterBody2D


class_name Pirate
@export var player:Player
const SPEED:int = 300
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player = get_tree().current_scene.get_node("player")
	$Timer.start(0.3)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	
	_move(delta)
	
func _move(delta:float)->void:
	var new_target:Vector2 =$NavigationAgent2D.get_next_path_position()
	var direction:Vector2 = global_position.direction_to(new_target)
	velocity = direction *SPEED * delta
	move_and_slide()

func _change_direction()->void:
	if player.global_position.distance_to(global_position) < 300:
		#follow the player
		$NavigationAgent2D.target_position = player.global_position
	else:
		#wander
		var new_direction:Vector2 = Vector2(randf_range(-1,1),randf_range(-1,1))
		$NavigationAgent2D.target_position = new_direction * 100



func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		body._take_dmg(1)
		await get_tree().create_timer(3).timeout

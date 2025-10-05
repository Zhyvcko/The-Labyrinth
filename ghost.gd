extends CharacterBody2D

@export var speed := 300
@onready var ghost_animation = $GhostAnimation

var should_move := false

func handle_movement(delta: float) -> void:
	if not should_move:
		return
		
	var direction = Input.get_vector("LeftMove", "RightMove", "UpMove", "DownMove")	
	velocity = direction * speed
	
	if Input.is_action_pressed("DownMove"):
		ghost_animation.play("forward")
	elif Input.is_action_pressed("UpMove"):
		ghost_animation.play("backward")
	elif Input.is_action_pressed("RightMove"):
		ghost_animation.play("right")
	elif Input.is_action_pressed("LeftMove"):
		ghost_animation.play("left")
	else:
		ghost_animation.play("forward")
	
	move_and_slide()	
	
	
func _process(delta: float) -> void: 
	handle_movement(delta)

	

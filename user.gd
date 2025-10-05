extends CharacterBody2D

@onready var animated_sprite_2d = $AnimatedSprite2D

var should_move := true
var ghost_time := 30
var is_ghost = false

func _ready() -> void:
	$Camera2D/ProgressBar.value = ghost_time

func _physics_process(delta):
	# detect input
	handle_movement(delta)
	# store variable
	
func _process(delta) -> void:
	$Camera2D/ProgressBar.value = $Timer.time_left
	
func handle_movement(delta: float) -> void:
	if not should_move:
		return
	
	var direction1 = Input.get_axis("LeftMove", "RightMove")
	var direction2 = Input.get_axis("UpMove", "DownMove")
	
	#animation
	if direction1 or direction2:
		animated_sprite_2d.play("Run")
	else:
		animated_sprite_2d.play("Idle")
	# flip
	if direction1 < 0:
		animated_sprite_2d.flip_h = true
	elif direction1 > 0:
		animated_sprite_2d.flip_h = false
		
	
	# apply to velocity
	velocity.x = direction1 * 180
	velocity.y = direction2 * 180
	
	# move 
	move_and_slide()
	
func _on_timer_timeout() -> void:
	get_tree().quit()
	#$Timer.start()

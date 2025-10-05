extends Node2D

var active_player

@onready var user = $User
@onready var ghost = $Ghost

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	active_player = user

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ghost"):
		print("switching to ghostz")
		if active_player == user:
			user.should_move = false
			ghost.should_move = true
			active_player = ghost
			$Ghost/Camera2D.make_current()
			$Ghost.visible = true
			$User.is_ghost = true
		elif active_player == ghost:
			ghost.should_move = false
			user.should_move = true
			active_player = user
			$User/Camera2D.make_current()
			$Ghost.visible = false
			$User.is_ghost = false
			
	active_player.handle_movement(delta)
	

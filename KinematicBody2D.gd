extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

enum direction {
	up,
	down,
	left,
	right
}

enum state {
	idle,
	walking
}

const SPEED = 16 * 60
var last_direction = direction.down
var current_state = state.idle
var velocity = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if Input.is_action_just_pressed("ui_down"):
		last_direction = direction.down
		current_state = state.walking
		velocity.y = SPEED
	elif Input.is_action_just_pressed("ui_up"):
		last_direction = direction.up
		current_state = state.walking
		velocity.y = -SPEED
	elif Input.is_action_just_pressed("ui_left"):
		last_direction = direction.left
		current_state = state.walking
		velocity.x = -SPEED
	elif Input.is_action_just_pressed("ui_right"):
		last_direction = direction.right
		current_state = state.walking
		velocity.x = +SPEED
	else:
		current_state = state.idle
		velocity = Vector2.ZERO

	match current_state:
		state.walking:
			do_move(delta)


func do_move(delta):
	var info = move_and_collide(velocity * delta)
	print(info)

extends CharacterBody2D

@export var speed: int = 400
@export var sprint_speed: int = 800  
@export var gravity: int = 1200
@export var jump_speed: int = -500
@export var double_jump_speed: int = -500  
@export var sprint_time: float = 0.3 

var can_double_jump = false
var last_input_time = 0
var last_direction = 0
var is_sprinting = false

func get_input():
	velocity.x = 0

	# **Handle Jump & Double Jump**
	if is_on_floor():
		can_double_jump = true 
		if Input.is_action_just_pressed("jump"):
			velocity.y = jump_speed
	elif can_double_jump and Input.is_action_just_pressed("jump"):
		velocity.y = double_jump_speed
		can_double_jump = false  

	# **Handle Sprint**
	var current_time = Time.get_ticks_msec() / 1000.0  

	if Input.is_action_just_pressed("right") or Input.is_action_just_pressed("left"):
		var direction = 1 if Input.is_action_just_pressed("right") else -1
		if direction == last_direction and (current_time - last_input_time) <= sprint_time:
			is_sprinting = true
		else:
			is_sprinting = false

		last_direction = direction
		last_input_time = current_time

	# **Gerakan Normal & Sprint**
	var current_speed = sprint_speed if is_sprinting else speed
	if Input.is_action_pressed("right"):
		velocity.x += current_speed
	if Input.is_action_pressed("left"):
		velocity.x -= current_speed


func _physics_process(delta):
	velocity.y += delta * gravity
	get_input()
	move_and_slide()


func _process(_delta):
	# **Animasi**
	if not is_on_floor():
		$Animator.play("Jump")
	elif velocity.x != 0:
		if is_sprinting:
			$Animator.play("sprint") 
		else:
			$Animator.play("Walk")
	else:
		$Animator.play("Idle")

	if velocity.x != 0:
		$Sprite2D.flip_h = velocity.x < 0

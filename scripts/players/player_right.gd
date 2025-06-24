extends CharacterBody2D

@onready var PR_sprite: AnimatedSprite2D = $AnimatedSprite2D

const SPEED = 130.0 #NOTE: DEFAULT IS 300.0
const JUMP_VELOCITY = -300.0 #NOTE: DEFAULT IS -400.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("PR_jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	#NOTE: THIS DOESN'T DO ANYTHING YET.
	#if Input.is_action_just_pressed("PL_action"): 
		#pass

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("PR_left", "PR_right")
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	#Flips the sprite TODO: Add to player_two
	if direction > 0.0: #You changed this from Brackeys to be 0.0, because it's a float now.
		PR_sprite.flip_h = false
	elif direction < 0.0:
		PR_sprite.flip_h = true

	move_and_slide()

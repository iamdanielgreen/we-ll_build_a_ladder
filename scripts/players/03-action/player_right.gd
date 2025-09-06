# PLAYER RIGHT
extends CharacterBody2D

@onready var PR_sprite: AnimatedSprite2D = $AnimatedSprite2D

const SPEED = 130.0 #NOTE: DEFAULT IS 300.0
const JUMP_VELOCITY = -300.0 #NOTE: DEFAULT IS -400.0

func _ready() -> void:
	#POINTS PLAYER TOWARDS LEFT ON GAME START. 
	#NOTE: THIS IS NOT THE BEST SOLUTION, BUT IT WORKS.
	PR_sprite.flip_h = true

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
	
	#HOLDING HANDS TEST
	#if Input.is_action_pressed("PR_holdhands"):
		#GameManager.PR_holdhands = true
	#elif Input.is_action_just_released("PR_holdhands"):
		#GameManager.PR_holdhands = false
	
	#MOVEMENT
	if is_on_floor():
		if direction == 0.0:
			if Input.is_action_pressed("PR_action"):
				PR_sprite.play("action")
			else:
				PR_sprite.play("idle")
		else:
			if Input.is_action_pressed("PR_action"):
				PR_sprite.play("action-walk")
			else:
				PR_sprite.play("walk")
	
	
	# NOTE: PROTOTYPE PLAYER RIGHT SCRIPT
	#if is_on_floor():
		#if direction == 0.0:
			#if GameManager.holding_hands: 
				#PR_sprite.play("idle_hands")
			#else:
				#var current_scene_file = get_tree().current_scene.scene_file_path
				#if current_scene_file == "res://scenes/levels/test_build_three_levels/test_build_three_level_4.tscn":
					#PR_sprite.play("really_idle")
				#else:
					#PR_sprite.play("idle")
		#else:
			#if GameManager.holding_hands:
				#PR_sprite.play("run_hands")
			#else:
				#PR_sprite.play("run")

	move_and_slide()


#func _on_holding_hands_collider_body_entered(body: Node2D) -> void:
	#if body.is_in_group("player"):
		#print("Player Right wants to hold hands.")
		#if Input.is_action_pressed("PR_holdhands"):
			#GameManager.PR_holdhands = true
			#print("Player Left is holding hands")
		#elif Input.is_action_just_released("PR_holdhands"):
			#GameManager.PR_holdhands = false


func _on_holding_hands_collider_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	GameManager.player_in_range = true


func _on_holding_hands_collider_area_shape_exited(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	GameManager.player_in_range = false

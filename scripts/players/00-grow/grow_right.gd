# PLAYER - "GROW RIGHT"

extends CharacterBody2D

@onready var PR_sprite: AnimatedSprite2D = $AnimatedSprite2D
#@onready var sunbeam: Area2D = $SunbeamCollider
@onready var sunbeam: Sprite2D = $SunbeamSprite

const SPEED = 130.0 #NOTE: DEFAULT IS 300.0
const JUMP_VELOCITY = -300.0 #NOTE: DEFAULT IS -400.0

var plant_can_grow = false # GROWLEFT IS INSIDE "SUNBEAMCOLLIDER"
var growing_time: float = 3.0 # TIME IT TAKES TO ACTIVATE WIN CONDITION.
var grown = false # TRIGGERS WIN_CONDITION = TRUE IN ""
#var sun_position = Vector2(position.x, position.y)

func _ready() -> void:
	#POINTS PLAYER TOWARDS LEFT ON GAME START. 
	#NOTE: THIS IS NOT THE BEST SOLUTION, BUT IT WORKS.
	#PR_sprite.flip_h = true
	GameManager.happy_plant = false
	sunbeam.hide()
	# TODO: SET POSITION OF THE SUN TO SO THAT IT'S UNDERNEATH THE TIMER
	# OR, YOU KNOW, JUST SLIGHTLY MOVE THE SUN. UGH. (NUDGED TO Y -83 FROM Y -93)

func _physics_process(delta: float) -> void:

	if Input.is_action_pressed("PR_action"): 
		sunbeam.show()
		PR_sprite.play("action")
		if plant_can_grow == true:
			growing_time -= delta
			print("The plant is growing.")
	else:
		if Input.is_action_just_released("PR_action"):
			sunbeam.hide()
			PR_sprite.play("idle")
			
	if Input.is_action_just_pressed("PR_jump"):
		PR_sprite.play("no-jump")
	
	#if Input.is_action_just_pressed("PR_jump"):
		#PR_sprite.play("no-jump")
		#await get_tree().create_timer(0.5).timeout
		#PR_sprite.play("idle")
	#
		
	
	var direction := Input.get_axis("PR_left", "PR_right")
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	#Flips the sprite # NOTE: IS THIS NEEDED HERE?
	if direction > 0.0: #You changed this from Brackeys to be 0.0, because it's a float now.
		PR_sprite.flip_h = true
		PR_sprite.play("idle")
	elif direction < 0.0:
		PR_sprite.flip_h = false
		PR_sprite.play("idle")
	
	#HOLDING HANDS TEST
	#if Input.is_action_pressed("PR_holdhands"):
		#GameManager.PR_holdhands = true
	#elif Input.is_action_just_released("PR_holdhands"):
		#GameManager.PR_holdhands = false
	
	#MOVEMENT
	# AT PRESENT IDLE ANIMATION PLAYS, AS CHARACTER IS NEVER ON FLOOR. 
	# NEED TO ADJUST THIS TO ALLOW ACTION WALK TO TRIGGER.
	
	# NOTE: GROW RIGHT IS NEVER ON FLOOR, SO DOES THIS ACTUALLY MATTER?
	#if is_on_floor():
		#if direction == 0.0:
			#if Input.is_action_pressed("PR_action"):
				#PR_sprite.play("action")
			#else:
				#PR_sprite.play("idle")
		#else:
			#if Input.is_action_pressed("PR_action"):
				#PR_sprite.play("action") # NORMALLY "ACTION-WALK". ONLY RELEVANT IN THIS INSTANCE. 
			#else:
				#PR_sprite.play("walk")
	
	move_and_slide()
	
	if growing_time <= 0:
		grown = true
		GameManager.happy_plant = true
		PR_sprite.play("win")


#func _on_holding_hands_collider_body_entered(body: Node2D) -> void:
	#if body.is_in_group("player"):
		#print("Player Right wants to hold hands.")
		#if Input.is_action_pressed("PR_holdhands"):
			#GameManager.PR_holdhands = true
			#print("Player Left is holding hands")
		#elif Input.is_action_just_released("PR_holdhands"):
			#GameManager.PR_holdhands = false


func _on_sunbeam_collider_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	plant_can_grow = true

	
func _on_sunbeam_collider_area_shape_exited(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	plant_can_grow = false
	growing_time = 3.0

func _on_holding_hands_collider_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	GameManager.player_in_range = true

func _on_holding_hands_collider_area_shape_exited(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	GameManager.player_in_range = false

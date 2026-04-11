# GAMEMANAGER SCRIPT

extends Node

enum game_mode {TimerOn, TimerOff}

var current_game_mode: game_mode

var PL_holdhands = false
var PR_holdhands = false
var player_in_range = false
var holding_hands = false

var demo_credits = false

#LEVEL X: WE'LL BUILD A LADDER
var PL_canBuild = false # IS LADDER_LEFT IN WOOD_BUILD_COLLIDER? (ladder_left.gd, ladder_wood.gd)
var builder_count = 0 # HOW MANY PLAYERS ARE IN WOOD_BUILD_COLLIDER? (ladder_wood.gd)
var can_build = false # ARE BOTH PLAYERS IN WOOD_BUILD_COLLIDER? (ladder_wood.gd, player scripts)
var active_player = 0 # WHO CAN CURRENTLY PRESS THE ACTION BUTTON? (level script, player scripts)
var ladder_move = true # CAN THE LADDER MOVE? (ladder_ladder.gd)
var ladder_count = 0 # HOW MANY TIMES HAS THE LADDER MOVED? (level script)

#LEVEL X: WE'LL GROW TOGETHER
var happy_plant = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if PL_holdhands and PR_holdhands and player_in_range:
		holding_hands = true
		print("Condition met.")
	else:
		holding_hands = false	
	
	if builder_count == 2:
		# Determine which player is the active player.
		if active_player == 0:
			active_player = randi_range(1,2)
			print("Right now the Active Player is " + str(active_player))
		can_build = true
	
	# NOTE: DISABLE FOR WEBGL BUILDS.
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()

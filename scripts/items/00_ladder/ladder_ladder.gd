extends StaticBody2D
# ERROR CAUSED FROM IT STARTING FROM POLYGON 2D, CHANGED TO STATICBODY2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:

	#if Input.is_action_just_pressed("PL_action") and GameManager.can_build:
		#ladderMove()
	
	if GameManager.can_build:
		if GameManager.active_player == 1:
			if Input.is_action_just_pressed("PL_action"):
				ladderMove()
		elif GameManager.active_player == 2:
			if Input.is_action_just_pressed("PR_action"):
				ladderMove()
		
func ladderMove():
	GameManager.can_build = false
	position.y -= 10
	GameManager.ladder_count +=1
	#NOTE: THIS IS WHERE THE ACTIVE PLAYER SHOULD SWITCH.
	if GameManager.active_player == 1:
		GameManager.active_player = 2
	else:
		GameManager.active_player = 1
	GameManager.can_build = true
	print("The Active Player is now " + str(GameManager.active_player))
	

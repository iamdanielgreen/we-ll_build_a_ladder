#NOTE: WBAL TEMPLATE SCRIPT

extends Node2D

@onready var countdown_timer: CanvasLayer = $UI/CountdownTimer
@onready var level_title: Label = $UI/LevelTitle/TextLabels/well_use_a_placeholder
@onready var tutorial_text: Node = $UI/TutorialPrompts/text_labels/placeholder_tutorial_text

@onready var player_left: CharacterBody2D = $Players/LadderLeft
@onready var player_right: CharacterBody2D = $Players/LadderRight

@onready var level_win_screen: CanvasLayer = $UI/LevelWinMenu
@onready var next_level_button: Button = $UI/LevelWinMenu/LevelWinMenu_Buttons/next_level_button

@onready var clapping_test: AudioStreamPlayer = $Audio/ClappingTest

var player_left_win = false
var player_right_win = false

#var tutorial_condition = true #NOTE: REENABLE IF YOU NEED A TUTORIAL FOR SOME REASON.
var win_condition = false 

func _ready() -> void:
	levelStart()
	#tutorial_prompt() #NOTE: REENABLE IF YOU NEED A TUTORIAL FOR SOME REASON.

func _process(_delta: float) -> void:
	GameManager.current_game_mode = GameManager.game_mode.TimerOff #NOTE: DISABLE TO ACTIVATE TIMER.
	
	if player_left_win and player_right_win:
		win_condition = true
		
	if Input.is_action_just_pressed("auto_win"):
		if tutorial_text.visible == true:
			tutorial_text.visible = false
			win_condition = true
		else:
			win_condition = true
			
	if GameManager.ladder_hit == 6:
		win_condition = true
		
		
	if win_condition:
		#NOTE: BELOW FUNCTION IS FOR TEST PURPOSES.
		#disable_controls()
		await get_tree().create_timer(0.5).timeout
		levelEnd()
		
	#NOTE: BELOW IS COMMENTED OUT AS TEMPLATE IS BASED ON "WE MAKE A MOVEMENT". IF YOU'RE
	# STILL WONDERING WHY THIS IS HERE, IT'S PROBABLY OK TO DELETE IT.
	#if Input.is_action_just_pressed("PL_left") or Input.is_action_just_pressed("PL_right"):
		#player_left_win = true
		#if tutorial_text.visible == true:
			#tutorial_text.visible = false
		#else:
			#pass
		#
	#if Input.is_action_just_pressed("PR_left") or Input.is_action_just_pressed("PR_right"):
		#player_right_win = true
		#if tutorial_text.visible == true:
			#tutorial_text.visible = false
		#else:
			#pass

func levelStart():
	GameManager.ladder_hit = 0
	level_title.visible = true
	countdown_timer.visible = false
	get_tree().paused = true
	await get_tree().create_timer(1.25).timeout #NOTE: TIME VALUE MUST BE A FLOATING POINT.
	get_tree().paused = false
	GameManager.PL_holdhands = false
	GameManager.PR_holdhands = false
	countdown_timer.visible = true
	level_title.queue_free()

#NOTE: TUTORIAL SYSTEM DIASBLED, BUT CODE REMAINS SO THAT YOU DON'T HAVE TO DIG IT OUT AGAIN.
#func tutorial_prompt():
	#await get_tree().create_timer(3.0).timeout
	#if tutorial_condition:
		#tutorial_text.visible = true
		#await get_tree().create_timer(5.5).timeout
		#tutorial_text.visible = false
	#else:
		#pass
	
func levelEnd():
	if clapping_test.playing:
		await clapping_test.finished
	else:
		clapping_test.play()
		
	#NOTE: TUTORIAL SYSTEM DIASBLED, BUT CODE REMAINS SO THAT YOU DON'T HAVE TO DIG IT OUT AGAIN.
	#if tutorial_text.visible == true:
		#tutorial_text.visible = false
	#else:
		#pass
		
	if GameManager.current_game_mode == GameManager.game_mode.TimerOn:
		if countdown_timer.time > 1.5:
			await get_tree().create_timer(1.0).timeout
			countdown_timer.stop_timer()
			countdown_timer.hide()
			level_win_screen.show()
			next_level_button.grab_focus()
			clapping_test.stop()
			get_tree().paused = true
		#countdown_timer.queue_free() #NOTE: 29/06/2025 - THIS CAUSES A CRASH. SO LET'S NOT USE IT.
			await get_tree().create_timer(0.25).timeout
		else:
			countdown_timer.stop_timer()
			countdown_timer.hide()
			level_win_screen.show()
			next_level_button.grab_focus()
			clapping_test.stop()
			get_tree().paused = true
	else:
		await get_tree().create_timer(1.0).timeout
		level_win_screen.show()
		next_level_button.grab_focus()
		get_tree().paused = true
	
	#if countdown_timer.time > 1.5:
		#await get_tree().create_timer(1.0).timeout
		#countdown_timer.stop_timer()
		#countdown_timer.hide()
		#level_win_screen.show()
		#next_level_button.grab_focus()
		#get_tree().paused = true
	##countdown_timer.queue_free() #NOTE: 29/06/2025 - THIS CAUSES A CRASH. SO LET'S NOT USE IT.
		#await get_tree().create_timer(0.25).timeout
	#else:
		#countdown_timer.stop_timer()
		#countdown_timer.hide()
		#level_win_screen.show()
		#next_level_button.grab_focus()
		#get_tree().paused = true
		
#NOTE: BELOW FUNCTION IS FOR TEST PURPOSES.
#func disable_controls():
	#player_left.set_process(false)
	#player_left.set_physics_process(false)
	#player_left.set_process_input(false)

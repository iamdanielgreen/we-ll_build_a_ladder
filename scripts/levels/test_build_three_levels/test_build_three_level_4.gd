# TEST BUILD THREE, TUTORIAL 04: "WE'LL SHARE SILENCE"

extends Node2D

@onready var countdown_timer: CanvasLayer = $UI/CountdownTimer
@onready var level_title: Label = $UI/LevelTitle/TextLabels/we_share_silence_text
#NOTE: THIS NEEDS TO BE UPDATED
@onready var tutorial_text: Label = $UI/TutorialPrompts/text_labels/nothing_text

@onready var player_left: CharacterBody2D = $Players/PlayerLeft
@onready var player_right: CharacterBody2D = $Players/PlayerRight

@onready var level_win_screen: CanvasLayer = $UI/LevelWinMenu
@onready var next_level_button: Button = $UI/LevelWinMenu/LevelWinMenu_Buttons/next_level_button

var player_left_win = false
var player_right_win = false

var silence_time: float = 5.0  
var tutorial_time: float = 0.0

#TODO Does this work?
var tutorial_condition = true

var win_condition = false #I KNOW YOU SAID LEVEL_WIN_CONDITION ABOVE BUT WHATEVER.

#NOTE: VAR USED FOR TESTING
#var gameStart = false

func _ready() -> void:
	levelStart()
	print("Timer has started.")
	
	#TODO: IS THE TUTORIAL USEFUL HERE? CAN YOU REALLY TELL THE PLAYER TO "TRY DOING NOTHING"?
	#await get_tree().create_timer(3.0).timeout
	#if tutorial_condition:
		#tutorial_prompt.visible = true
	#else:
		#pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if player_left_win and player_right_win:
		win_condition = true
	
	if win_condition:
		levelEnd()
	
	#NOTE: DO YOU WANT TO CALL "TIME" SOMETHING ELSE?
	silence_time -= delta
	
	if silence_time <= 0:
		print("Timer has stopped.")
		player_left_win = true
		player_right_win = true


	if Input.is_action_just_pressed("PL_jump"):
		silence_time = 5.0
		tutorial_prompt()
		print("Player Left has reset the timer.")
	elif Input.is_action_just_pressed("PL_action"):
		silence_time = 5.0
		tutorial_prompt()
		print("PL HONK.")
	elif Input.is_action_just_pressed("PL_left"):
		silence_time = 5.0
		tutorial_prompt()
		print("Player Left moved left.")
	elif Input.is_action_just_pressed("PL_right"):
		silence_time = 5.0
		tutorial_prompt()
		print("Player Left moved right.")
		
	if Input.is_action_just_pressed("PR_jump"):
		silence_time = 5.0
		tutorial_prompt()
		print("Player Right has reset the timer.")
	elif Input.is_action_just_pressed("PR_action"):
		silence_time = 5.0
		tutorial_prompt()
		print("PR HONK.")
	elif Input.is_action_just_pressed("PR_left"):
		silence_time = 5.0
		tutorial_prompt()
		print("Player Right moved left.")
	elif Input.is_action_just_pressed("PL_right"):
		silence_time = 5.0
		tutorial_prompt()
		print("Player Right moved right.")
	
	if GameManager.holding_hands:
		silence_time = 5.0
		print("Awww.")

func levelStart():
	level_title.visible = true
	countdown_timer.visible = false
	get_tree().paused = true
	await get_tree().create_timer(1.25).timeout #NOTE: TIME VALUE MUST BE A FLOATING POINT.
	get_tree().paused = false
	GameManager.PL_holdhands = false
	GameManager.PR_holdhands = false
	countdown_timer.visible = true
	level_title.queue_free()
	
func levelEnd():#
	#NOTE: REMEMBER THIS IS DIFFERENT ON THIS LEVEL, DANIEL.
	

	#
	##await  get_tree().create_timer(1.0).timeout
	#countdown_timer.stop_timer()
	##countdown_timer.queue_free() #NOTE: 29/06/2025 - THIS CAUSES A CRASH. SO LET'S NOT USE IT.
	#await get_tree().create_timer(0.25).timeout
	#countdown_timer.hide()
	#level_win_screen.show()
	#next_level_button.grab_focus()
	#get_tree().paused = true
	
	if GameManager.current_game_mode == GameManager.game_mode.TimerOn:
		if countdown_timer.time > 1.5:
			await  get_tree().create_timer(1.0).timeout
			countdown_timer.stop_timer()
			countdown_timer.hide()
			level_win_screen.show()
			next_level_button.grab_focus()
			get_tree().paused = true
			#countdown_timer.queue_free() #NOTE: 29/06/2025 - THIS CAUSES A CRASH. SO LET'S NOT USE IT.
			await get_tree().create_timer(0.25).timeout
		else:
			countdown_timer.stop_timer()
			countdown_timer.hide()
			level_win_screen.show()
			next_level_button.grab_focus()
			get_tree().paused = true
	else:
		await get_tree().create_timer(1.0).timeout
		level_win_screen.show()
		next_level_button.grab_focus()
		get_tree().paused = true
	
func tutorial_prompt():
	#if tutorial_time == 0:
		tutorial_text.visible = true
		await get_tree().create_timer(2.0).timeout
		tutorial_text.visible = false

	
	#
	#if player does something
	#show tutorial
	#start tutorial_time
	#if player does something within three seconds, don't show tutorial again


#If the tutorial prompt is rendered visible

# LEVEL (5?): "WE'LL SHARE SILENCE"

extends Node2D

@onready var countdown_timer: CanvasLayer = $UI/CountdownTimer
@onready var level_title: Label = $UI/LevelTitle/TextLabels/we_share_silence_text
@onready var tutorial_text: Label = $UI/TutorialPrompts/text_labels/nothing_text

@onready var player_left: CharacterBody2D = $Players/SilenceLeft
@onready var player_right: CharacterBody2D = $Players/SilenceRight

@onready var level_win_screen: CanvasLayer = $UI/LevelWinMenu
@onready var next_level_button: Button = $UI/LevelWinMenu/LevelWinMenu_Buttons/next_level_button

@onready var sl_action: AudioStreamPlayer = $Audio/SilenceGuys/SlAction
@onready var sl_jump: AudioStreamPlayer = $Audio/SilenceGuys/SlJump
@onready var sl_walk: AudioStreamPlayer = $Audio/SilenceGuys/SlWalk
@onready var sr_action: AudioStreamPlayer = $Audio/SilenceGuys/SrAction
@onready var sr_jump: AudioStreamPlayer = $Audio/SilenceGuys/SrJump
@onready var sr_walk: AudioStreamPlayer = $Audio/SilenceGuys/SrWalk


# THIS WORKS
#@onready var silence: AudioStreamPlayer = $Audio/YeahHTest
# THIS DOESN'T
#@onready var silence: AudioStreamPlayer = $Audio/Silenceshort

@onready var clapping_test: AudioStreamPlayer = $Audio/ClappingTest

var player_left_win = false
var player_right_win = false

var silence_time: float = 5.0  

#TODO Does this work?
var tutorial_condition = true

var win_condition = false #I KNOW YOU SAID LEVEL_WIN_CONDITION ABOVE BUT WHATEVER.

#NOTE: VAR USED FOR TESTING
#var gameStart = false

func _ready() -> void:
	# NOTE: USE SCRIPT BELOW TO TEST LEVEL WITHOUT TIMER.
	#GameManager.current_game_mode = GameManager.game_mode.TimerOff
	get_node("/root/AudioPlayer").playing = false
	levelStart()

	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if player_left_win and player_right_win:
		win_condition = true
		# NOTE: CODE BELOW IS ONLY FOR VIDEO CAPTURE, NEEDS TO BE DEACTIVATED.
		GameManager.demo_credits = true
	
	if win_condition:
		levelEnd()
	
	#NOTE: DO YOU WANT TO CALL "TIME" SOMETHING ELSE?
	silence_time -= delta


	# TODO: THIS SHOULD ALLOW THE SILENCE TO PLAY
	#if silence_time <= 4.5:
		#if silence.playing:
			#await silence.finished
			##silence.stop()
			#print("Silence has ended.")
		#else:
			#if silence_time >= 4.1:
				#silence.play()
	
		
	
	if silence_time <= 0:
		print("Timer has stopped.")
		player_left_win = true
		player_right_win = true
	


	if Input.is_action_just_pressed("PL_jump"):
		silence_time = 5.0
		tutorial_prompt()
		sl_jump.play()

	elif Input.is_action_just_pressed("PL_action"):
		silence_time = 5.0
		tutorial_prompt()
		sl_action.play()
		
	elif Input.is_action_just_pressed("PL_left"):
		silence_time = 5.0
		tutorial_prompt()
		sl_walk.play()

	elif Input.is_action_just_pressed("PL_right"):
		silence_time = 5.0
		tutorial_prompt()
		sl_walk
		
	if Input.is_action_just_pressed("PR_jump"):
		silence_time = 5.0
		tutorial_prompt()
		sr_jump.play()

	elif Input.is_action_just_pressed("PR_action"):
		silence_time = 5.0
		tutorial_prompt()
		sr_action.play()
		
	elif Input.is_action_just_pressed("PR_left"):
		silence_time = 5.0
		tutorial_prompt()
		sr_walk.play()
	
	elif Input.is_action_just_pressed("PL_right"):
		silence_time = 5.0
		tutorial_prompt()
		sr_walk.play()
	
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
	if clapping_test.playing:
		await clapping_test.finished
	else:
		clapping_test.play()
	
	
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
		tutorial_text.visible = true
		await get_tree().create_timer(2.0).timeout
		tutorial_text.visible = false

	
	#
	#if player does something
	#show tutorial
	#start tutorial_time
	#if player does something within three seconds, don't show tutorial again


#If the tutorial prompt is rendered visible

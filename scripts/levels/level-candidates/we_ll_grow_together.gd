# LEVEL 00: "WE'LL GROW TOGETHER"

extends Node2D

@onready var countdown_timer: CanvasLayer = $UI/CountdownTimer
@onready var level_title: Label = $"UI/LevelTitle/TextLabels/we-ll_grow_together"

@onready var player_left: CharacterBody2D = $Players/GrowLeft
@onready var PL_sprite = $Players/GrowLeft/AnimatedSprite2D
@onready var player_right: CharacterBody2D = $Players/GrowRight
@onready var PR_sprite = $Players/GrowRight/AnimatedSprite2D

@onready var level_win_screen: CanvasLayer = $UI/LevelWinMenu
@onready var next_level_button: Button = $UI/LevelWinMenu/LevelWinMenu_Buttons/next_level_button
@onready var clapping_test: AudioStreamPlayer = $Audio/ClappingTest

#NOTE: DO THESE DO ANYTHING HERE?
var player_left_win = false
var player_right_win = false
var win_condition = false 

var grow_time: float = 3.0

func _ready() -> void:
	# NOTE: USE SCRIPT BELOW TO TEST LEVEL WITHOUT TIMER.
	#GameManager.current_game_mode = GameManager.game_mode.TimerOn
	levelStart()
	
func _process(delta: float) -> void:
	
	if player_right.grown == true:
		win_condition = true
	
	#if player_left_win and player_right_win:
		#win_condition = true
	
	if win_condition:
		levelEnd()
	
	#grow_time -= delta # YOU NEED TO STICK THIS IN A DIFFERENT CONDITIONAL. THIS WILL BE A PLAYER COLLISION
	# SITUATION.
	
	
	if grow_time <= 0:
		print("Timer has stopped.")
		player_left_win = true
		player_right_win = true
	
	# NOTE: Win conditions for other levels.
		#if player_left_win and player_right_win:
	#if Input.is_action_pressed("PL_action") and Input.is_action_pressed("PR_action"):
		#win_condition = true
	
	if win_condition:
		if clapping_test.playing:
			await clapping_test.finished
			levelEnd()
		else:
			clapping_test.play()
			


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

	
func levelEnd():
	if clapping_test.playing:
		await clapping_test.finished
	else:
		clapping_test.play()
		

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

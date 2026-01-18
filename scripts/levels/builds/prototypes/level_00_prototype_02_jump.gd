extends Node2D

@onready var countdown_timer: CanvasLayer = $UI/CountdownTimer
@onready var level_title: Label = $UI/LevelTitle/TextLabels/we_jump_for_joy_text
@onready var tutorial_text: Label = $UI/TutorialPrompts/TextLabels/down_action_button_text
@onready var player_left: CharacterBody2D = $PlayerLeft
@onready var player_right: CharacterBody2D = $PlayerRight
@onready var level_win_screen: CanvasLayer = $UI/LevelWin
@onready var restart_button: Button = $UI/LevelWin/VBoxContainer/restart_button

var player_left_win = false
var player_right_win = false

var tutorial_condition = true
var win_condition = false 

func _ready() -> void:
	levelStart()
	tutorial_prompt()

func _process(delta: float) -> void:
	if player_left_win and player_right_win:
		win_condition = true
	
	if win_condition:
		levelEnd()
		
	if Input.is_action_just_pressed("PL_jump"):
		player_left_win = true
		if tutorial_text.visible == true:
			tutorial_text.visible = false
		else:
			pass
		
	if Input.is_action_just_pressed("PR_jump"):
		player_right_win = true
		if tutorial_text.visible == true:
			tutorial_text.visible = false
		else:
			pass

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
	
func tutorial_prompt():
	await get_tree().create_timer(3.0).timeout
	if tutorial_condition:
		tutorial_text.visible = true
		await get_tree().create_timer(5.5).timeout
		tutorial_text.visible = false
	else:
		pass
	
func levelEnd():
	if tutorial_text.visible == true:
		tutorial_text.visible = false
	else:
		pass
	
	if countdown_timer.time > 1.5:
		await  get_tree().create_timer(1.0).timeout
		countdown_timer.stop_timer()
		countdown_timer.hide()
		level_win_screen.show()
		restart_button.grab_focus()
		get_tree().paused = true
	#countdown_timer.queue_free() #NOTE: 29/06/2025 - THIS CAUSES A CRASH. SO LET'S NOT USE IT.
		await get_tree().create_timer(0.25).timeout
	else:
		countdown_timer.stop_timer()
		countdown_timer.hide()
		level_win_screen.show()
		restart_button.grab_focus()
		get_tree().paused = true

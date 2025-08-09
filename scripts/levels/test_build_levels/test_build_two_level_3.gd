extends Node2D

@onready var countdown_timer: CanvasLayer = $UI/CountdownTimer
@onready var level_title: Label = $UI/LevelTitle/TextLabels/we_are_climbing_text
@onready var player_left: CharacterBody2D = $PlayerLeft
@onready var player_right: CharacterBody2D = $PlayerRight
@onready var level_win_screen: CanvasLayer = $UI/LevelWin
@onready var restart_button: Button = $UI/LevelWin/VBoxContainer/restart_button

var player_left_win = false
var player_right_win = false
var win_condition = false #I KNOW YOU SAID LEVEL_WIN_CONDITION ABOVE BUT WHATEVER.

#NOTE: VAR USED FOR TESTING
#var gameStart = false

func _ready() -> void:
	levelStart()

	#gameStart = true
	
	#if gameStart == true:
		#print("The level has started now.")
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if player_left_win and player_right_win:
		win_condition = true
	
	if win_condition:
		levelEnd()

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
	countdown_timer.stop_timer()
	#countdown_timer.queue_free() #NOTE: 29/06/2025 - THIS CAUSES A CRASH. SO LET'S NOT USE IT.
	await get_tree().create_timer(0.25).timeout
	countdown_timer.hide()
	level_win_screen.show()
	restart_button.grab_focus()
	get_tree().paused = true


func _on_test_macguffin_body_entered(body: Node2D) -> void:
	if body == player_left:
		player_left_win = true

	if body == player_right:
		player_right_win = true
		
func _on_test_macguffin_body_exited(body: Node2D) -> void:
	if body == player_left:
		player_left_win = false
	if body == player_right:
		player_right_win = false

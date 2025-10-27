# MAIN_MENU.GD

extends Control

# NOTE: COMMENTED ONREADYS ARE NOT USED IN PRESENT VERSION OF GAME. REMOVE?
@onready var start_game_button: Button = $TitleScreen/MainMenuButtons/StartGame_Button
@onready var credits_button: Button = $TitleScreen/MainMenuButtons/Credits_Button
@onready var credits_main_menu_button: Button = $Credits_Screen/Credits_MainMenu_Button
#@onready var credits_feedback_button: Button = $Credits_Screen/CreditsScreen_Buttons/Credits_Feedback_Button
#@onready var feedback_button: Button = $TitleScreen/MainMenuButtons/Feedback_Button
#@onready var feedback_main_menu_button: Button = $PlaytestFeedback_Screen/FeedbackGroup/Feedback_MainMenu_button
@onready var controls_main_menu_button: Button = $Controls_Screen/Controls_Main_Menu_Button
#@onready var quit_button: Button = $TitleScreen/MainMenuButtons/Quit_Button

@onready var background: Sprite2D = $bgNotebook

@onready var game_mode_screen: Control = $GameMode_Screen
@onready var timer_off_button: Button = $GameMode_Screen/VBoxContainer/TimerOff_Button
@onready var timer_on_button: Button = $GameMode_Screen/VBoxContainer/TimerOn_Button

@onready var oh_my_goodness: AudioStreamPlayer = $GameMode_Screen/OhMyGoodness
@onready var the_end: AudioStreamPlayer = $Credits_Screen/TheEnd

#@onready var wip_continue_button: Button = $WIP_screen/VBoxContainer/wipContinueButton

func _ready() -> void:
	background.hide()
	AudioPlayer.play_level_music()
	start_game_button.grab_focus()	
	# NOTE: ATTEMPT TO GET LEVEL MUSIC TO RESTART
	#if AudioPlayer._play_level_music():
		#return
	#else:
		#AudioPlayer.play_level_music()
	
func _process(delta: float) -> void:
	if GameManager.demo_credits:
		$TitleScreen.hide()
		background.show()
		$Credits_Screen.show()
		#credits_feedback_button.hide()
		credits_main_menu_button.grab_focus()

func _on_start_game_button_pressed() -> void:
	$TitleScreen.hide()
	background.show()
	$GameMode_Screen.show()
	timer_off_button.grab_focus()
	
func _on_timer_off_button_pressed() -> void:
	GameManager.current_game_mode = GameManager.game_mode.TimerOff
	#get_tree().change_scene_to_file("res://scenes/levels/test_build_three_levels/test_build_three_level_1.tscn")
	get_tree().change_scene_to_file("res://scenes/levels/degree_show_build/degree_show_build_1.tscn")


func _on_timer_on_button_pressed() -> void:
	GameManager.current_game_mode = GameManager.game_mode.TimerOn
	oh_my_goodness.play()
	await oh_my_goodness.finished
	#get_tree().change_scene_to_file("res://scenes/levels/test_build_three_levels/test_build_three_level_1.tscn")
	get_tree().change_scene_to_file("res://scenes/levels/degree_show_build/degree_show_build_1.tscn")
	
func _on_controls_button_pressed() -> void:
	$TitleScreen.hide()
	$Controls_Screen.show()
	controls_main_menu_button.grab_focus()
	
func _on_credits_button_pressed() -> void:
	$TitleScreen.hide()
	$Credits_Screen.show()
	background.show()
	credits_main_menu_button.grab_focus()
	
func _on_credits_main_menu_button_pressed() -> void:
	if GameManager.demo_credits:
		the_end.play()
		await the_end.finished
		GameManager.demo_credits = false
		$Credits_Screen.hide()
		$TitleScreen.show()
		start_game_button.grab_focus()
	else:
		$Credits_Screen.hide()
		$TitleScreen.show()
		start_game_button.grab_focus()
	#AudioPlayer.play_level_music()
	
	# NOTE: THREE BUTTONS BELOW NOT USED IN FINAL GAME
	# TODO: DELETE BEFORE FINAL BUILD
#func _on_credits_feedback_button_pressed() -> void:
	#GameManager.demo_credits = false
	#$Credits_Screen.hide()
	#$PlaytestFeedback_Screen.show()
	#feedback_main_menu_button.grab_focus()
	

#func _on_feedback_button_pressed() -> void:
	#$TitleScreen.hide()
	#$PlaytestFeedback_Screen.show()
	#feedback_main_menu_button.grab_focus()

#func _on_feedback_main_menu_button_pressed() -> void:
	#$PlaytestFeedback_Screen.hide()
	#$TitleScreen.show()
	#start_game_button.grab_focus()

func _on_controls_main_menu_button_pressed() -> void:
	$Controls_Screen.hide()
	$TitleScreen.show()
	start_game_button.grab_focus()

func _on_quit_button_pressed() -> void:
	get_tree().quit()

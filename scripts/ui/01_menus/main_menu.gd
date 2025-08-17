# MAIN_MENU.GD

extends Control

@onready var start_game_button: Button = $TitleScreen/MainMenuButtons/StartGame_Button
@onready var credits_button: Button = $TitleScreen/MainMenuButtons/Credits_Button
@onready var credits_main_menu_button: Button = $Credits_Screen/Credits_MainMenu_Button
@onready var credits_feedback_button: Button = $Credits_Screen/CreditsScreen_Buttons/Credits_Feedback_Button
@onready var feedback_button: Button = $TitleScreen/MainMenuButtons/Feedback_Button
@onready var feedback_main_menu_button: Button = $PlaytestFeedback_Screen/FeedbackGroup/Feedback_MainMenu_button
@onready var quit_button: Button = $TitleScreen/MainMenuButtons/Quit_Button

@onready var wip_continue_button: Button = $WIP_screen/VBoxContainer/wipContinueButton

func _ready() -> void:
	start_game_button.grab_focus()	
	
func _process(delta: float) -> void:
	if GameManager.demo_credits:
		$TitleScreen.hide()
		$Credits_Screen.show()
		#credits_feedback_button.hide()
		credits_main_menu_button.grab_focus()

func _on_start_game_button_pressed() -> void:
	$TitleScreen.hide()
	$WIP_screen.show()
	wip_continue_button.grab_focus()
	#NOTE: RESTORE BELOW ONCE YOU MOVE TO FINAL GAME
	#get_tree().change_scene_to_file("res://scenes/levels/test_build_levels/test_build_two_level_1.tscn")
	
func _on_wip_continue_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/levels/test_build_levels/test_build_two_level_1.tscn")
		
func _on_credits_button_pressed() -> void:
	$TitleScreen.hide()
	$Credits_Screen.show()
	credits_main_menu_button.grab_focus()
	
func _on_credits_main_menu_button_pressed() -> void:
	GameManager.demo_credits = false
	$Credits_Screen.hide()
	$TitleScreen.show()
	start_game_button.grab_focus()
	
func _on_credits_feedback_button_pressed() -> void:
	GameManager.demo_credits = false
	$Credits_Screen.hide()
	$PlaytestFeedback_Screen.show()
	feedback_main_menu_button.grab_focus()
	
func _on_feedback_button_pressed() -> void:
	$TitleScreen.hide()
	$PlaytestFeedback_Screen.show()
	feedback_main_menu_button.grab_focus()

func _on_feedback_main_menu_button_pressed() -> void:
	$PlaytestFeedback_Screen.hide()
	$TitleScreen.show()
	start_game_button.grab_focus()
	
func _on_quit_button_pressed() -> void:
	get_tree().quit()

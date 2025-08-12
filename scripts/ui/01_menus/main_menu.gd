# MAIN_MENU.GD

extends Control

@onready var start_game_button: Button = $TitleScreen/MainMenuButtons/StartGame_Button
@onready var credits_button: Button = $TitleScreen/MainMenuButtons/Credits_Button
@onready var feedback_button: Button = $TitleScreen/MainMenuButtons/Feedback_Button
@onready var quit_button: Button = $TitleScreen/MainMenuButtons/Quit_Button

@onready var wip_continue_button: Button = $WIP_screen/VBoxContainer/wipContinueButton

func _ready() -> void:
	start_game_button.grab_focus()	

func _on_start_game_button_pressed() -> void:
	$TitleScreen.hide()
	$WIP_screen.show()
	wip_continue_button.grab_focus()
	#NOTE: RESTORE BELOW ONCE YOU MOVE TO FINAL GAME
	#get_tree().change_scene_to_file("res://scenes/levels/test_build_levels/test_build_two_level_1.tscn")
	
func _on_wip_continue_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/levels/test_build_levels/test_build_two_level_1.tscn")
		
func _on_credits_button_pressed() -> void:
	pass
	#$"TitleScreen".hide()
	#$"Credits".show()
	#credits_back_button.show()
	#credits_back_button.grab_focus()

#func _on_credits_back_button_pressed() -> void:
	#$"Credits".hide()
	#$"TitleScreen".show()
	#start_button.grab_focus()
	
func _on_feedback_button_pressed() -> void:
	pass
	#$"TitleScreen".hide()
	#$"Credits".hide()
	#$"Feedback".show()
	#feedback_back_button.show()
	#feedback_back_button.grab_focus()

#func _on_feedback_back_button_pressed() -> void:
	#$"Feedback".hide()
	#$"TitleScreen".show()
	#start_button.grab_focus()

func _on_quit_button_pressed() -> void:
	get_tree().quit()

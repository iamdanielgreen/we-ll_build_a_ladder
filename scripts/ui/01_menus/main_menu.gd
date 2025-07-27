extends Control

#NOTE: WHAT'S BELOW IS STRAIGHT UP BORROWED FROM EMU PARADE.

#TODO: At present you have the SELECT/SHARE/BACK/- controller buttons set to hard quit the game.
#NOTE: 02/07/2025 - THIS ISN'T PRESENTLY TRUE. 

@onready var start_game_button: Button = $TitleScreen/MainMenuButtons/StartGame_Button
@onready var credits_button: Button = $TitleScreen/MainMenuButtons/Credits_Button
@onready var feedback_button: Button = $TitleScreen/MainMenuButtons/Feedback_Button
@onready var quit_button: Button = $TitleScreen/MainMenuButtons/Quit_Button

func _ready() -> void:
	start_game_button.grab_focus()	

func _on_start_game_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/levels/level_00_prototype02_jump.tscn")
	
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

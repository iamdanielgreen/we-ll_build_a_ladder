#NOTE: DANIEL, YOU ONCE AGAIN FORGOT THE THING WHERE YOU 

extends CanvasLayer

@onready var pause_menu: CanvasLayer = $"."
@onready var resume_button: Button = $VBoxContainer/resume_button
@onready var main_menu_button: Button = $VBoxContainer/main_menu_button
@onready var quit_button: Button = $VBoxContainer/quit_button


var paused = false

func _process(delta):
	if Input.is_action_just_pressed("pause"):
		pauseMenu()
				
func pauseMenu():
	if paused:
		pause_menu.hide()
		get_tree().paused = false
		
	else:
		pause_menu.show()
		resume_button.grab_focus()
		#if GameManager.current_scene == "level_01_bedroom":
			#player.visible = false
		#else:
			#pass
		get_tree().paused = true
		
	paused = !paused # TODO What exactly is happening here? NOTE: 20/06/25 - DANIEL, THIS IS STILL A FLIP/FLOP.

func _on_resume_button_pressed() -> void:
	pauseMenu()

func _on_main_menu_button_pressed() -> void:
	pass #TODO: RETURN TO MAIN MENU

func _on_quit_button_pressed() -> void:
	get_tree().quit()

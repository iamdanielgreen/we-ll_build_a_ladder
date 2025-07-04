extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func _on_next_level_button_pressed() -> void:
	pass # Replace with function body.

func _on_restart_button_pressed() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()

func _on_main_menu_button_pressed() -> void:
	pass # Replace with function body.

func _on_quit_button_pressed() -> void:
	get_tree().quit()

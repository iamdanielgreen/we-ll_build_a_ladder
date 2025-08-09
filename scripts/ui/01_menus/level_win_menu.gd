extends CanvasLayer

@onready var next_level_button: Button = $VBoxContainer/next_level_button

const FILE_BEGIN = "res://scenes/levels/test_build_levels/test_build_two_level_"

	
func _on_next_level_button_pressed() -> void:
	#NOTE: SCRIPT TO MOVE TO NEXT LEVEL
	var current_scene_file = get_tree().current_scene.scene_file_path
	var next_level_number = current_scene_file.to_int() + 1
	int() + 1
	print(next_level_number)
	var next_level_path = FILE_BEGIN + str(next_level_number) + ".tscn"
	get_tree().change_scene_to_file(next_level_path)

func _on_restart_button_pressed() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()

func _on_main_menu_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/ui/01_menus/main_menu.tscn")

func _on_quit_button_pressed() -> void:
	get_tree().quit()

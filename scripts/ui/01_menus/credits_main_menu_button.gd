extends Node

@onready var credits_main_menu_button: Button = $"."

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if GameManager.demo_credits:
		credits_main_menu_button.grab_focus()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

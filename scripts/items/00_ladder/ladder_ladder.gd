extends StaticBody2D
# ERROR CAUSED FROM IT STARTING FROM POLYGON 2D, CHANGED TO STATICBODY2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:

	if Input.is_action_just_pressed("PL_action"):
		position.y -= 10
		GameManager.ladder_hit +=1
		print(GameManager.ladder_hit)

extends Polygon2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_threshold_collider_body_entered(body: Node2D) -> void:
	if body.is_in_group("ladder"):
		GameManager.ladder_hit = true
		print("Level is solved.")

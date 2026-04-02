extends Polygon2D

@onready var build_collider: Area2D = $WoodBuildCollider


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	


func _on_wood_build_collider_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		GameManager.PL_canBuild = true


func _on_wood_build_collider_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		GameManager.PL_canBuild = false

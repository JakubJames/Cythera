extends Node3D


func _on_dissapear_area_body_entered(body: Node3D) -> void:
	if body.name == 'Player':
		visible = !visible

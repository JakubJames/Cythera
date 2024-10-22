extends AnimationPlayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	play("spaceship")


func _process(_delta: float) -> void:
	if !is_playing():
		get_tree().change_scene_to_file("res://Levels/venus.tscn");

extends Label

var fade_played: bool = false

func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.name == 'Player':
		visible = true
		$"../../../Ambient Music".stop()
		$"../../../../Remnant/FinalJingle".play()
		$"../../../../FinalAnimation".play('Final')
		fade_played = true
		
	
func _process(_delta: float) -> void:
	if fade_played and !$"../../../../FinalAnimation".is_playing():
		get_tree().quit()

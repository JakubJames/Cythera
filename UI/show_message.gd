extends Label


func _on_player_go_away() -> void:
	visible = true
	$Timer.start()


func _on_timer_timeout() -> void:
	visible = false

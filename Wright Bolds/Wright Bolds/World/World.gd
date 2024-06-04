extends Node


func _ready() -> void:
	
	# center camera
	var rect := get_window().get_visible_rect()
	Camera2DMain.set_state_follow_point( Vector2( rect.size.x / 2, rect.size.y / 2 ) )
	
	
	
	pass

extends Pipe


func _ready() -> void:
	set_gap_position( 200 )


func _input( event: InputEvent ) -> void:
	
	if ( event is InputEventKey ):
		if ( event.pressed and event.keycode == KEY_0 ):
			$Sprite2D.position.y = random_pipe_spot() 
	
	pass

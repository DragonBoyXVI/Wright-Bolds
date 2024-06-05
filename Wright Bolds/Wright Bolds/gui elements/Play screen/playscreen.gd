extends Control


signal start_game

func _ready() -> void:
	
	
	
	pass


func _input( event: InputEvent ) -> void:
	
	if ( event.is_action_pressed( "Enter" ) ):
		
		start_game.emit()
		queue_free()
		
		pass
	
	pass

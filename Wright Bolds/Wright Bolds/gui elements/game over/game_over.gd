extends Control


func _input( event: InputEvent ) -> void:
	
	if ( event.is_action_pressed( "Enter" ) ):
		get_tree().paused = false
		get_tree().reload_current_scene()
	
	pass


func _on_player_player_killed() -> void:
	
	$LabelCurrentScore.text = "You got {num} points!".format( { "num": ScoreHandler.current_score } )
	$LabelHighScore.text = "Saved high score: {num}".format( { "num": ScoreHandler.current_high_score } )
	if ( ScoreHandler.new_high_score ):
		$RichTextLabel.show()
	
	pass

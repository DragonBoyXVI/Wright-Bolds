extends Song


func play():
	
	$AnimationPlayer.play( "music" )
	
	pass

func _process( delta: float ) -> void:
	super( delta )
	if ( not tick ): return
	
	var mouse_pos := Camera2DMain.get_global_mouse_position()
	if ( mouse_pos.x < -200 ):
		create_tween().tween_property( $Square, "volume_db", min_volume, 1 )
		create_tween().tween_property( $Saw, "volume_db", max_volume, 1 )
	elif ( mouse_pos.x > 200 ):
		create_tween().tween_property( $Square, "volume_db", max_volume, 1 )
		create_tween().tween_property( $Saw, "volume_db", min_volume, 1 )
	else:
		create_tween().tween_property( $Square, "volume_db", max_volume, 1 )
		create_tween().tween_property( $Saw, "volume_db", max_volume, 1 )
	
	pass

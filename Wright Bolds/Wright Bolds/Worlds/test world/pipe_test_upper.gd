extends PipeSegment


func set_size( size: float ):
	
	# sprite
	#const sprite_size := 128.0
	#$Sprite2D.scale.y = size / sprite_size
	$Sprite2D.position.y = size
	
	# collision
	var shape_node: CollisionShape2D = $ComponentKillbox/CollisionShape2D
	var shape: RectangleShape2D = shape_node.shape
	shape.size.y = size
	shape_node.position.y = size / 2
	
	pass


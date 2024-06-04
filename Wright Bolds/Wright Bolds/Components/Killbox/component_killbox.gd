extends Area2D
class_name ComponentKillbox




func _on_body_entered( body: Node2D ) -> void:
	
	if ( body is Player ):
		body.kill()
	
	pass

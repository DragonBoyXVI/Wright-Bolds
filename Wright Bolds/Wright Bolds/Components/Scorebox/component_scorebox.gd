extends Area2D
class_name ComponentScorebox


@export var point_value: int = 1


func _on_body_entered( body: Node2D ) -> void:
	
	if ( body is Player ):
		ScoreHandler.give_points( point_value )
	
	pass

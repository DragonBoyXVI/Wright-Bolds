extends State


# vars
@export var camera: Camera2D
@export var object_to_follow: Node2D
var object_position: Vector2

@export_range( 0, 1 ) var speed: float = 0.25


# funcs
func _process( _delta: float ) -> void:
	
	object_position = object_to_follow.position
	
	pass

func _physics_process( _delta: float ) -> void:
	
	var camera_position := camera.position
	
	camera_position = lerp( camera_position, object_position, speed )
	
	camera.position = camera_position
	
	pass

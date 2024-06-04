extends State


# vars
@export var camera: Camera2D
@export var point_to_follow: Vector2

@export_range( 0, 1 ) var speed: float = 0.25


# funcs
func _physics_process( _delta: float ) -> void:
	
	var camera_position := camera.position
	
	camera_position = lerp( camera_position, point_to_follow, speed )
	
	camera.position = camera_position
	
	pass

extends Node
class_name Level


##
#Base class for game levels


@export_group( "Pipes" )
@export var pipe_count: int = 10
@export var pipe_spacing: float = 800
@export var pipe_scene: PackedScene


func _ready() -> void:
	
	Global.current_level = self
	
	
	# place pipes
	var pipe_offset := 1200.0
	for num in pipe_count:
		
		# make pipe
		var new_pipe: Pipe = pipe_scene.instantiate(  )
		add_child( new_pipe )
		
		# position it
		new_pipe.position.x = pipe_offset
		pipe_offset += pipe_spacing
		new_pipe.random_pipe_spot()
		
		pass
	
	pipe_offset -= 1200.0
	Global.pipe_respawn = pipe_offset
	
	pass

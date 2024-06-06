extends Node
class_name Level


##
#Base class for game levels


@export_group( "Pipes" )
@export var pipe_count: int = 25
@export var pipe_spacing: float = 800
@export var pipe_scene: PackedScene


func _ready() -> void:
	
	Global.current_level = self
	
	
	# place pipes
	const off := 1800.0
	var pipe_offset: float = off
	for num in pipe_count:
		
		# make pipe
		var new_pipe: Pipe = pipe_scene.instantiate(  )
		add_child( new_pipe )
		
		# position it
		new_pipe.position.x = pipe_offset
		pipe_offset += pipe_spacing
		new_pipe.random_pipe_spot()
		
		pass
	
	pipe_offset -= off
	@warning_ignore("narrowing_conversion") #FUCK YOUUUUUUUUUUUU
	Global.pipe_respawn = pipe_offset
	
	pass


@export_group( "Scrolling Background" )
@export var bg_layer: CanvasLayer
@export var repeat_at: float = 1920 / 1.5
@export var parallax_factor: float = 0.25


func _process( delta: float ) -> void:
	
	bg_layer.offset.x -= Global.pipe_speed * delta * parallax_factor
	if ( bg_layer.offset.x < -repeat_at ):
		bg_layer.offset.x += repeat_at
	
	pass

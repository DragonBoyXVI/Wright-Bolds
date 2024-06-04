extends State


# vars
@export var camera: Camera2D
@export var speed: float = 1200
@export var scroll_speed: float = 2
@export var scroll_min : float = 0.2
@export var scroll_max : float = 5

@onready var scroll_min_vector := Vector2.ONE * scroll_min
@onready var scroll_max_vector := Vector2.ONE * scroll_max

var input_speed: Vector2
var input_scroll: float


func _process( _delta: float ) -> void:
	var slow := 1.0
	if ( Input.is_action_pressed("Slow") ): slow = 0.05
	
	# get inputs
	input_speed = Input.get_vector( "Move Left", "Move Right", "Move Up", "Move Down" ) * slow
	
	input_scroll = 0
	if ( Input.is_action_just_released( "Zoom In" ) ):
		input_scroll += 1
	elif ( Input.is_action_just_released( "Zoom Out" ) ):
		input_scroll -= 1
	input_scroll *= scroll_speed * slow
	
	pass

func _physics_process( delta: float ) -> void:
	delta = 1.0 / Engine.physics_ticks_per_second # ignore Engine.time_scale
	
	
	# move camera
	var frame_speed = speed * delta * input_speed
	camera.position += frame_speed
	
	
	# scroll lens
	var lens_size = camera.zoom
	lens_size += Vector2.ONE * input_scroll * delta
	lens_size = clamp( lens_size, scroll_min_vector, scroll_max_vector )
	camera.zoom = lens_size
	
	pass

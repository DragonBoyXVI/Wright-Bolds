# holds things that MusicManager needs to interact with this.
extends Node
class_name Song

const min_volume := -80.0
const max_volume := 0.0
const mid_volume: float = lerp( min_volume, max_volume, 0.5 )

@export var tick_rate: float = 0.25 # seconds
var tick_time: float = 0
var tick := false

var stopping := false

func play():
	
	
	pass

func stop( fade_time: float = 5.0 ):
	create_tween().tween_callback( queue_free ).set_delay( fade_time )
	stopping = true
	
	for track in get_children():
		
		if ( track is AudioStreamPlayer ):
			create_tween().tween_property( track, "volume_db", min_volume, fade_time - 0.1 )
		
		pass
	
	pass


func _process( delta: float ) -> void:
	tick_time += delta
	if ( tick_time >= tick_rate ):
		tick_time -= tick_rate
		tick = true
	else:
		tick = false

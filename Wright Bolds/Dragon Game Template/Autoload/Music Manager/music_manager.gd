extends Node

# signals
signal song_changed


# vars
var current_song: Song
var previous_song: Song

var loaded_songs := {}

# funcs
func _ready() -> void:
	
	Settings.update.connect( update_settings )
	
	pass

func change_song( song: String, fade_time: float = 5 ):
	
	# free old song
	if ( current_song ):
		
		current_song.stop( fade_time )
		previous_song = current_song
		
		pass
	else:
		fade_time = 0.0
	
	
	# handle new song
	var new_song: Song
	
	# check to see if we already have the packed scene loaded
	if ( loaded_songs.has( song ) ):
		new_song = loaded_songs[ song ].instantiate()
	else:
		
		var _scene: PackedScene = load( song )
		loaded_songs[ song ] = _scene
		new_song = _scene.instantiate()
		
		pass
	
	# add song to children
	current_song = new_song
	add_child( new_song )
	
	# start song
	create_tween().tween_callback( current_song.play ).set_delay( fade_time )
	
	pass

func update_settings():
	
	if ( Settings.pause_song ):
		process_mode = Node.PROCESS_MODE_INHERIT
	else:
		process_mode = Node.PROCESS_MODE_ALWAYS
	
	pass

# holds information related to game settings
extends Node


# signals
signal update


#region variables

const file_path := "user://settings.ini"


const sec_engine := "Engine"
#region

const frame_rate_name := "frame_rate"
var frame_rate := 30
func set_frame_rate( value: int ):
	
	frame_rate = value
	Engine.max_fps = value
	
	pass

const physics_rate_name := "physics_rate"
var physics_rate := 30
func set_physics_rate( value: int ):
	
	physics_rate = value
	Engine.physics_ticks_per_second = value
	
	pass

const stretch_mode_name := "stretch_mode"
var stretch_mode := 1
var stretch_mode_settings := [ Window.CONTENT_SCALE_MODE_DISABLED, Window.CONTENT_SCALE_MODE_CANVAS_ITEMS, Window.CONTENT_SCALE_MODE_VIEWPORT ]
func set_stretch_mode( mode: int ):
	
	stretch_mode = mode
	get_window().content_scale_mode = stretch_mode_settings[ mode ]
	
	pass

#endregion

const sec_game := "Game"
#region

const volume_min := -60.0
const volume_max := 0.0

const volume_master_name := "volume_master"
var volume_master := 1.0
var volume_master_bus := AudioServer.get_bus_index( "Master" )
func set_volume_master( volume: float ):
	
	volume_master = volume / 100
	AudioServer.set_bus_volume_db( volume_master_bus, lerp( volume_min, volume_max, volume_master ) )
	
	pass

const volume_music_name := "volume_music"
var volume_music := 0.8
var volume_music_bus := AudioServer.get_bus_index( "Music" )
func set_volume_music( volume: float ):
	
	volume_music = volume / 100
	AudioServer.set_bus_volume_db( volume_music_bus, lerp( volume_min, volume_max, volume_music ) )
	
	pass

const volume_voice_name := "volume_voice"
var volume_voice := 1.0
var volume_voice_bus := AudioServer.get_bus_index( "Voice" )
func set_volume_voice( volume: float ):
	
	volume_voice = volume / 100
	AudioServer.set_bus_volume_db( volume_voice_bus, lerp( volume_min, volume_max, volume_voice ) )
	
	pass

const volume_sfx_name := "volume_sfx"
var volume_sfx := 1.0
var volume_sfx_bus := AudioServer.get_bus_index( "SFX" )
func set_volume_sfx( volume: float ):
	
	volume_sfx = volume / 100
	AudioServer.set_bus_volume_db( volume_sfx_bus, lerp( volume_min, volume_max, volume_sfx ) )
	
	pass

const pause_focus_name := "pause_on_focus"
var pause_focus := true
func set_pause_focus( value: bool ):
	
	pause_focus = value
	
	pass

const pause_song_name := "pause_music_on_pause"
var pause_song := false
func set_pause_song( value: bool ):
	
	pause_song = value
	
	pass

#endregion

const sec_disability := "Accessibility"
#region

const language_name := "Language"
var language := 0
func set_language( index: int ):
	
	language = index
	match index:
		
		0: TranslationServer.set_locale( "en" )
		1: TranslationServer.set_locale( "es" )
		2: TranslationServer.set_locale( "jp" )
	
	pass

const flashing_lights_name := "flashing_lights"
var flashing_lights := true
func set_flashing_lights( value: bool ):
	
	flashing_lights = value
	
	pass

#endregion

#endregion


#region funcs

func file_save():
	
	var file = ConfigFile.new()
	
	file.set_value( sec_engine, frame_rate_name, frame_rate )
	file.set_value( sec_engine, physics_rate_name, physics_rate )
	file.set_value( sec_engine, stretch_mode_name, stretch_mode )
	
	file.set_value( sec_game, volume_master_name, volume_master * 100 )
	file.set_value( sec_game, volume_music_name, volume_music * 100 )
	file.set_value( sec_game, volume_voice_name, volume_voice * 100 )
	file.set_value( sec_game, volume_sfx_name, volume_sfx * 100 )
	file.set_value( sec_game, pause_focus_name, pause_focus )
	file.set_value( sec_game, pause_song_name, pause_song )
	
	file.set_value( sec_disability, language_name, language )
	file.set_value( sec_disability, flashing_lights_name, flashing_lights )
	
	file.save( file_path )
	print( "Settings: Saved to ", file_path )
	
	pass

func file_load():
	
	var file = ConfigFile.new()
	var error = file.load( file_path )
	
	if ( error != OK ):
		print( "Settings: File not loaded. Reason: ", error_string( error ) )
	else:
		print( "Settings: File loaded from ", file_path )
	
	
	set_frame_rate( file.get_value( sec_engine, frame_rate_name, frame_rate ) )
	set_physics_rate( file.get_value( sec_engine, physics_rate_name, physics_rate ) )
	set_stretch_mode( file.get_value( sec_engine, stretch_mode_name, stretch_mode ) )
	
	set_volume_master( file.get_value( sec_game, volume_master_name, volume_master * 100 ) )
	set_volume_music( file.get_value( sec_game, volume_music_name, volume_music * 100 ) )
	set_volume_voice( file.get_value( sec_game, volume_voice_name, volume_voice * 100 ) )
	set_volume_sfx( file.get_value( sec_game, volume_sfx_name, volume_sfx * 100 ) )
	set_pause_focus( file.get_value( sec_game, pause_focus_name, pause_focus ) )
	set_pause_song( file.get_value( sec_game, pause_song_name, pause_song ) )
	
	set_language( file.get_value( sec_disability, language_name, language ) )
	set_flashing_lights( file.get_value( sec_disability, flashing_lights_name, flashing_lights ) )
	
	pass

#endregion 

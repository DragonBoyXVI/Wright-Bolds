extends Control


# signals


# nodes
@export var node_colorrect: ColorRect


@export var node_menu : TabContainer

@export var node_resume_button: Button
@export var node_settings_button: Button
@export var node_exit_app_button: Button


@export var node_menu_settings: TabContainer

@export var node_fps_label: Label
@export var node_fps_hslider: HSlider
@export var node_physics_label: Label
@export var node_physics_hslider: HSlider
@export var node_stretch_button: OptionButton

@export var node_pause_focus_button: CheckButton

@export var node_vol_master_label: Label
@export var node_vol_master_hslider: HSlider
@export var node_vol_music_label: Label
@export var node_vol_music_hslider: HSlider
@export var node_vol_voice_label: Label
@export var node_vol_voice_hslider: HSlider
@export var node_vol_sfx_label: Label
@export var node_vol_sfx_hslider: HSlider
@export var node_pause_song_button: CheckButton

@export var node_language_button: OptionButton
@export var node_button_flashing_lights: CheckButton


# vars
var emit_change := true


# funcs
func _ready() -> void:
	
	# not paused, no need to be visible
	hide()
	
	
	# signal
	OmniControls.paused.connect( game_paused )
	OmniControls.unpaused.connect( game_unpaused )
	
	
	# set correct tabs
	node_menu.current_tab = 0
	node_menu_settings.current_tab = 0
	
	
	pass

func _input( event: InputEvent ) -> void:
	
	if ( event.is_action_pressed( "Backspace" ) ):
		
		if ( node_menu.current_tab == 0 ):
			_on_resume_button_pressed()
		else:
			
			node_menu.current_tab = 0
			node_resume_button.grab_focus.call_deferred()
			
			pass
		
		pass
	
	pass


func game_paused():
	
	# show menu
	show()
	node_resume_button.grab_focus()
	node_menu.current_tab = 0
	node_menu_settings.current_tab = 0
	
	
	# set settings
	emit_change = false
	
	node_fps_hslider.value = Settings.frame_rate
	node_physics_hslider.value = Settings.physics_rate
	node_stretch_button.selected = Settings.stretch_mode
	
	node_vol_master_hslider.value = Settings.volume_master * 100.0
	node_vol_music_hslider.value = Settings.volume_music * 100.0
	node_vol_voice_hslider.value = Settings.volume_voice * 100.0
	node_vol_sfx_hslider.value = Settings.volume_sfx * 100.0
	
	node_pause_focus_button.button_pressed = Settings.pause_focus
	node_pause_song_button.button_pressed = Settings.pause_song
	
	node_language_button.selected = Settings.language
	node_button_flashing_lights.button_pressed = Settings.flashing_lights
	
	emit_change = true
	
	pass

func game_unpaused():
	
	hide()
	Settings.update.emit()
	Settings.file_save()
	
	pass


# button responses
# Main
func _on_resume_button_pressed() -> void:
	
	var unpause_event := InputEventAction.new()
	unpause_event.action = "Pause"
	unpause_event.pressed = true
	
	Input.parse_input_event( unpause_event )
	
	pass

func _on_settings_button_pressed() -> void:
	
	node_menu.current_tab = 1
	node_menu_settings.current_tab = 0
	node_menu_settings.get_tab_bar().grab_focus()
	
	pass

func _on_exit_app_button_pressed() -> void:
	
	get_tree().quit()
	
	pass

# settings
func _on_fpsh_slider_value_changed( value: float ) -> void:
	
	node_fps_label.text = tr( &"KEY_MENU_SETTINGS_FPS" ).format( { "fps": value } )
	if ( emit_change ):
		@warning_ignore("narrowing_conversion")
		Settings.set_frame_rate( value )
	
	pass

func _on_physics_h_slider_value_changed( value: float ) -> void:
	
	node_physics_label.text = tr( &"KEY_MENU_SETTINGS_PHYSICS" ).format( { "fps": value } )
	if ( emit_change ):
		@warning_ignore("narrowing_conversion")
		Settings.set_physics_rate( value )
	
	pass

func _on_stretch_button_item_selected( index: int ) -> void:
	
	if ( emit_change ):
		Settings.set_stretch_mode( index )
	
	pass


func _on_volume_master_h_slider_value_changed( value: float ) -> void:
	
	node_vol_master_label.text = tr( &"KEY_MENU_SETTINGS_VOL_MASTER" ).format( { "vol": value } )
	if ( emit_change ):
		Settings.set_volume_master( value )
	
	pass

func _on_volume_music_h_slider_value_changed( value: float ) -> void:
	
	node_vol_music_label.text = tr( &"KEY_MENU_SETTINGS_VOL_MUSIC" ).format( { "vol": value } )
	if ( emit_change ):
		Settings.set_volume_music( value )
	
	pass

func _on_volume_voice_h_slider_value_changed( value: float ) -> void:
	
	node_vol_voice_label.text = tr( &"KEY_MENU_SETTINGS_VOL_VOICE" ).format( { "vol": value } )
	if ( emit_change ):
		Settings.set_volume_voice( value )
	
	pass

func _on_volume_sfxh_slider_value_changed( value: float ) -> void:
	
	node_vol_sfx_label.text = tr( &"KEY_MENU_SETTINGS_VOL_SFX" ).format( { "vol": value } )
	if ( emit_change ):
		Settings.set_volume_sfx( value )
	
	pass

func _on_pause_focus_button_toggled( toggled_on: bool ) -> void:
	
	if ( emit_change ):
		Settings.set_pause_focus( toggled_on )
	
	pass

func _on_pause_song_button_toggled( toggled_on: bool ) -> void:
	
	if ( emit_change ):
		Settings.set_pause_song( toggled_on )
	
	pass


func _on_language_button_item_selected( index: int ) -> void:
	
	if ( emit_change ):
		Settings.set_language( index )
	
	pass

func _on_check_button_toggled( toggled_on: bool ) -> void:
	
	if ( emit_change ):
		Settings.set_flashing_lights( toggled_on )
	
	pass





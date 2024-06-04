extends Node


signal paused
signal unpaused

signal gui_hide
signal gui_show


@export var gui: CanvasLayer
var pause_on_not_focus := true

func _ready() -> void:
	
	Settings.update.connect( update_settings )
	
	pass

func _input( event: InputEvent ) -> void:
	
	if ( event.is_action_pressed( "Pause" ) ):
		
		var tree := get_tree()
		
		if ( tree.paused ):
			
			tree.paused = false
			unpaused.emit()
			
			pass
		else:
			
			tree.paused = true
			paused.emit()
			
			pass
		
		pass
	
	if ( event.is_action_pressed( "Fullscreen" ) ):
		
		var window = get_window()
		
		if ( window.mode == Window.MODE_FULLSCREEN ):
			
			window.mode = Window.MODE_WINDOWED
			
			pass
		else:
			
			window.mode = Window.MODE_FULLSCREEN
			
			pass
		
		pass
	
	
	if ( event.is_action_pressed( "Hide GUI" ) ):
		gui_hide.emit()
	elif ( event.is_action_released( "Hide GUI" ) ):
		gui_show.emit()
	
	pass

func _notification( what: int ) -> void:
	
	if ( what == NOTIFICATION_APPLICATION_FOCUS_OUT and pause_on_not_focus and not get_tree().paused ):
		
		var input = InputEventAction.new()
		input.action = "Pause"
		input.pressed = true
		
		Input.parse_input_event( input )
		
		pass
	
	pass

func update_settings():
	
	pause_on_not_focus = Settings.pause_focus
	
	pass

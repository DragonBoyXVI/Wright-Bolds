extends Node


@export var gui_layer: CanvasLayer
@export var pause_menu: Control


func _ready() -> void:
	
	# load settings
	Settings.file_load()
	Settings.update.emit()
	
	# center camera
	var rect := get_window().get_visible_rect()
	Camera2DMain.set_state_follow_point( Vector2( rect.size.x / 2, rect.size.y / 2 ) )
	
	#omni control signals
	OmniControls.gui_hide.connect( gui_layer.hide )
	OmniControls.gui_show.connect( gui_layer.show )
	
	pass

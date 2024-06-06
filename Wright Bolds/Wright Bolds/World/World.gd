extends Node


@export var gui_layer: CanvasLayer
@export var pause_menu: Control


func _ready() -> void:
	
	# load settings
	Settings.file_load()
	Settings.update.emit()
	
	# load highscores
	ScoreHandler.load_high_score()
	ScoreHandler.reset()
	
	# center camera
	var rect := get_window().get_visible_rect()
	Camera2DMain.set_state_follow_point( Vector2( rect.size.x / 2, rect.size.y / 2 ) )
	
	#omni control signals
	OmniControls.gui_hide.connect( gui_layer.hide )
	OmniControls.gui_show.connect( gui_layer.show )
	
	# score signals
	ScoreHandler.score_updated.connect( $AudioStreamPoint.play.bind( 0.0 ) )
	
	pass


func _on_playscreen_start_game() -> void:
	
	$Gui/BasicGui.show()
	$Player.process_mode = Node.PROCESS_MODE_INHERIT
	Global.current_level.process_mode = Node.PROCESS_MODE_INHERIT
	Global.pipe_speed = 600.0
	
	pass


func _on_player_player_killed() -> void:
	
	OmniControls.can_pause = false
	$Gui/BasicGui.hide()
	get_tree().paused = true
	$Gui/GameOver.show()
	ScoreHandler.save_high_score()
	$AudioStreamGameEnd.play( 0.0 )
	
	pass

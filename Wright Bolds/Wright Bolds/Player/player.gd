extends CharacterBody2D
class_name Player


##
#player object script


@export_group( "Stats" )
@export var weight: float = 1

@export_group( "Nodes" )
@export var state_machine: StateMachine
@export var animation: AnimationPlayer
@export var anim_pivot: Node2D
@export var sound: AudioStreamPlayer


func _process( _delta: float ) -> void:
	
	var fake_velocity := Vector2( 1920, velocity.y )
	anim_pivot.rotation = fake_velocity.angle()
	
	pass


signal player_killed
func kill():
	print( "oh nor" )
	print( "you got ", ScoreHandler.current_score, " points!" )
	#get_tree().quit.call_deferred()
	player_killed.emit()
	
	#Camera2DMain.set_state_follow_object( self )
	#Camera2DMain.zoom_target = Vector2( 2, 2 )
	
	pass

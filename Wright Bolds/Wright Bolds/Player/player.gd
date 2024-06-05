extends CharacterBody2D
class_name Player


##
#player object script


@export_group( "Stats" )
@export var weight: float = 1

@export_group( "Nodes" )
@export var state_machine: StateMachine  


func _process( _delta: float ) -> void:
	
	var fake_velocity := Vector2( 1920, velocity.y )
	rotation = fake_velocity.angle()
	
	pass


signal player_killed
func kill():
	print( "oh nor" )
	print( "you got ", ScoreHandler.current_score, " points!" )
	#get_tree().quit.call_deferred()
	player_killed.emit()
	pass

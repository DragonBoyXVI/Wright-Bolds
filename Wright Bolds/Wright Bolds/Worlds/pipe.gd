extends Node2D
class_name Pipe


##
# parent class for pipes


@export_group( "Pipe" )
@export_subgroup( "Sizing" )
@export var gap_size: float = 300
@export var gap_lowest_spot: float = 200
@export var gap_highest_spot: float = 600
@export_subgroup( "Nodes" )
@export var upper_pipe: PipeSegment
@export var lower_pipe: PipeSegment


func set_gap_position( spot: float ):
	
	if ( upper_pipe ):
		var deviant: float = spot - ( ( gap_size / 2 ) * randf_range( 0.95, 1 ) )
		if ( deviant < 1 ): deviant = 1
		upper_pipe.set_size( deviant )
	
	if ( lower_pipe ):
		var deviant: float = spot + ( ( gap_size / 2 ) * randf_range( 1, 1.05 ) )
		if ( deviant > 719 ): deviant = 719
		deviant = 720 - deviant
		lower_pipe.set_size( deviant )
	
	pass

func random_pipe_spot():
	
	var pipe_spot := randf_range( gap_lowest_spot, gap_highest_spot )
	set_gap_position( pipe_spot )
	#print( pipe_spot )
	
	return pipe_spot


func _physics_process( delta: float ) -> void:
	position.x -= Global.pipe_speed * delta
	
	if ( position.x < -Global.pipe_speed ):
		random_pipe_spot()
		position.x = Global.pipe_respawn# * randf_range( 0.8, 1.2 )

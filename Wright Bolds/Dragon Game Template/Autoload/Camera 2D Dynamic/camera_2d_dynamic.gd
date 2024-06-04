extends Camera2D


# signal


# nodes
@export var state_machine: StateMachine


# funcs
func set_state_follow_object( object: Node2D, speed: float = -1 ):
	var state := $StateMachine/FollowObject
	
	state.object_to_follow = object
	if ( speed > 0 ):
		state.speed = speed
	
	state_machine.change( "FollowObject" )
	
	pass

func set_state_follow_point( point: Vector2, speed: float = -1 ):
	var state := $StateMachine/FollowPoint
	
	state.point_to_follow = point
	if ( speed > 0 ):
		state.speed = speed
	
	state_machine.change( "FollowPoint" )
	
	pass

func set_state_manual():
	
	state_machine.change( "Manual" )
	
	pass



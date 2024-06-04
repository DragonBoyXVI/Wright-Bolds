# node that runs state functions from the child "state" nodes
extends Node
class_name StateMachine


# signals
signal state_changed


# nodes
var states: Dictionary = {}


# variables
var current_state: State
var previous_state: State
@export var initial_state: State


# funcs
func _ready() -> void: # add child nodes to state dictionary
	
	for child in get_children():
		
		# only states allowed
		if ( child is State ):
			
			child.process_mode = child.disable_mode # state machine calls these for us
			child.change_state.connect( change )
			states[ child.name ] = child
			
			pass
		
		pass
	
	# enter initial
	if ( initial_state ):
		change( initial_state.name )
	
	pass


func _process( delta: float ) -> void:
	if ( current_state ):
		current_state._process( delta )

func _physics_process( delta: float ) -> void:
	if ( current_state ):
		current_state._physics_process( delta )

func _input( event: InputEvent ) -> void:
	if ( current_state ):
		current_state._input( event )

func _unhandled_input( event: InputEvent ) -> void:
	if ( current_state ):
		current_state._unhandled_input( event )


func change( state: StringName ) -> void:
	
	# leave state
	if ( current_state ):
		current_state.leave()
	
	# get new state
	var new_state: State = states[ state ]
	
	#enter state
	current_state = new_state
	current_state.enter()
	
	# notify
	state_changed.emit()
	
	pass











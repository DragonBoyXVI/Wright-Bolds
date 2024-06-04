extends CharacterBody2D
class_name Player


##
#player object script


@export_group( "Stats" )
@export var weight: float = 1

@export_group( "Nodes" )
@export var state_machine: StateMachine


signal player_killed
func kill():
	print( "oh nor" )
	get_tree().quit.call_deferred()
	pass

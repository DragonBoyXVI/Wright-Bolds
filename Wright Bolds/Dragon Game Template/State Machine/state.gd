# basic script for state nodes, child to state machine
extends Node
class_name State


signal change_state


var disable_mode := Node.PROCESS_MODE_DISABLED
var enable_mode := Node.PROCESS_MODE_INHERIT


func enter() -> void:
	pass

func leave() -> void:
	pass


func _process( _delta: float ) -> void:
	pass

func _physics_process( _delta: float ) -> void:
	pass

func _input( _event: InputEvent ) -> void:
	pass

func _unhandled_input( _event: InputEvent ) -> void:
	pass

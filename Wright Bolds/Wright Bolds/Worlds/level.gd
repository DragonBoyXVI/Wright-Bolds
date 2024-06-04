extends Node
class_name Level


##
#Base class for game levels


@export_group( "Pipes" )
@export var pipe_count: int = 10
@export var pipe_spacing: float = 800


func _ready() -> void:
	
	Global.current_level = self
	
	pass

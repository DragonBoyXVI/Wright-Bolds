extends State
class_name StatePlayerFree


##
# free state where tha player can jump and shit


@export var player: CharacterBody2D
@export var jump_power: float = 900


func _physics_process( delta: float ) -> void:
	
	# weight player
	var gravity: float = Global.gravity * player.weight * delta
	player.velocity.y += gravity
	
	# move player
	player.move_and_slide()
	
	pass

func _unhandled_input( event: InputEvent ) -> void:
	
	if ( event.is_action_pressed( "Jump" ) ):
		
		player.velocity.y -= jump_power
		
		return
	
	pass

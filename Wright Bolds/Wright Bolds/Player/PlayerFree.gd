extends State
class_name StatePlayerFree


##
# free state where tha player can jump and shit


@export var player: Player
@export var jump_power: float = 900


func _physics_process( delta: float ) -> void:
	var fast_fall := 1.0
	if ( Input.is_action_pressed( "Fall" ) ): fast_fall = 2.0
	elif( Input.is_action_pressed( "Jump" ) ): fast_fall = 0.5
	
	# weight player
	var gravity: float = Global.gravity * player.weight * delta * fast_fall
	var down_velocity := player.velocity.y
	down_velocity = min( down_velocity + gravity, Global.gravity * fast_fall )
	player.velocity.y = down_velocity
	
	# move player
	player.move_and_slide()
	
	# cap height
	const y_limit := -100.0
	if ( player.position.y < y_limit ):
		player.position.y = y_limit
	
	pass

func _unhandled_input( event: InputEvent ) -> void:
	
	if ( event.is_action_pressed( "Jump" ) ):
		
		# make player jump
		var down_velocity := player.velocity.y
		down_velocity = max( down_velocity - jump_power, -jump_power )
		player.velocity.y = down_velocity
		
		return
	
	pass

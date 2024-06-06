extends State
class_name StatePlayerFree


##
# free state where tha player can jump and shit


@export var player: Player
@export var jump_power: float = 900

func enter():
	player.position.y = 720.0 / 2


func _physics_process( delta: float ) -> void:
	var fast_fall := 1.0
	if ( Input.is_action_pressed( "Backspace" ) ): fast_fall = 2.0
	elif( Input.is_action_pressed( "Enter" ) ): fast_fall = 0.5
	
	# weight player
	var gravity: float = Global.gravity * player.weight * delta * fast_fall
	var down_velocity := player.velocity.y
	down_velocity = min( down_velocity + gravity, Global.gravity * fast_fall )
	player.velocity.y = down_velocity
	
	# move player
	player.move_and_slide()
	
	# cap height
	const y_limit := -0.0
	if ( player.position.y < y_limit ):
		player.position.y = y_limit
	
	pass

func _unhandled_input( event: InputEvent ) -> void:
	
	if ( event.is_action_pressed( "Enter" ) ):
		
		# make player jump
		var down_velocity := player.velocity.y
		down_velocity = max( down_velocity - jump_power, -jump_power )
		player.velocity.y = down_velocity
		player.animation.play( "Flap" )
		player.animation.seek( 0.0 )
		
		get_window().set_input_as_handled()
		return
	
	pass

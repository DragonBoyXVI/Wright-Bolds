extends Level


func _ready() -> void:
	super()
	
	
	
	pass


@export var sidewalk: Sprite2D
@export var building: Sprite2D
@export var shit: Node2D
var shit_visible: Sprite2D
const repeat_at := 1280
func _process( delta: float ) -> void:
	var speed := Global.pipe_speed * delta
	
	if ( sidewalk ):
		
		sidewalk.position.x -= speed * 0.75
		if ( sidewalk.position.x < -repeat_at ):
			sidewalk.position.x = 0
		
		pass
	
	if ( building ):
		
		building.position.x -= speed * 0.45
		if ( building.position.x < -repeat_at ):
			building.position.x = 0
		
		pass
	
	if ( shit ):
		
		shit.position.x -= speed * 0.75
		if ( shit.position.x < -repeat_at ):
			
			shit.position.x = Global.pipe_respawn * randf_range( 0.8, 2 )
			if ( shit_visible ): shit_visible.hide()
			shit_visible = shit.get_children().pick_random()
			shit_visible.show()
			
		
		pass
	
	pass

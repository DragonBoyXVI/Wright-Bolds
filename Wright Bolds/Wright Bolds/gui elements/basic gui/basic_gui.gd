extends Control


func _ready() -> void:
	
	ScoreHandler.score_updated.connect( update_score_label )
	
	pass


func update_score_label():
	
	$Label.text = "Score: {num}".format( { "num": ScoreHandler.current_score } )
	
	pass

extends Node


##
# manages score files


var current_score: int = 0
signal score_updated


#const score_folder := "user://Scores/"
#var loaded_leaderboard: Array[ Dictionary ]


func give_points( points: int ):
	
	current_score += points
	new_high_score = ( current_score > current_high_score )
	
	score_updated.emit()
	
	pass


const score_location := "user://Score.ini"
var current_high_score: int = 0
var new_high_score := false
func load_high_score(): 
	
	var file := ConfigFile.new()
	file.load( score_location )
	
	current_high_score = file.get_value( "highscore", "score", 0 )
	
	pass

func save_high_score():
	
	var file := ConfigFile.new()
	var score: int = max( current_high_score, current_score )
	
	file.set_value( "highscore", "score", score )
	
	file.save( score_location )
	
	pass

func reset():
	
	current_score = 0
	new_high_score = false
	
	score_updated.emit()
	
	pass

extends Node


##
# manages score files


var current_score: int = 0
signal score_updated


const score_folder := "user://Scores/"
var loaded_leaderboard: Array[ Dictionary ]


func give_points( points: int ):
	
	current_score += points
	score_updated.emit()
	
	pass

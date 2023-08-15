extends Node

var coins = 0


var max_lives = 3
var lives = max_lives
var hud
func lose_live():
	lives -= 1
	hud.hearts_load()
	if lives == 0 :
		get_tree().change_scene_to_file("res://game_over.tscn")
		lives = 3


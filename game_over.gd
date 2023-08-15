extends Node2D




func _on_menu_btn_pressed():
	get_tree().change_scene_to_file("res://main.tscn")
	Global.coins = 0


func _on_reload_pressed():
	get_tree().change_scene_to_file("res://level_2.tscn")
	#if Global.player_progres == 0 :
	#	get_tree().change_scene_to_file("res://world.tscn")
	#elif Global.player_progres == 1 :
	#	get_tree().change_scene_to_file("res://level_2.tscn")


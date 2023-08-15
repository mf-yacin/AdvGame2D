extends CanvasLayer

#var coins = 0

func _ready():
	$Label.text = var_to_str(Global.coins)
	hearts_load()
	Global.hud = self


func _on_coins_collected():
	Global.coins += 1
	_ready()
	if Global.coins == 100 :   #ne fonction pas maintenant
		get_tree().change_scene_to_file("res://win_window.tscn")

func hearts_load():
	$HeartsFull.size.x =  Global.lives * 53
	$HeartsEmpty.size.x = (Global.max_lives - Global.lives) * 53

	$HeartsEmpty.position.x = $HeartsFull.position.x + $HeartsFull.size.x * $HeartsFull.scale.x


func _on_exit_pressed():
	get_tree().change_scene_to_file("res://main.tscn")




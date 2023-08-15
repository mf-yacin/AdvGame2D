extends Node2D




var doorstate := false
func _ready():
	$AnimatedPorte.play("close")
	


func _on_crack_door_is_opened():
	$TimerDoor.start()
	doorstate = true

func _on_timer_door_timeout():
	$AnimatedPorte.play("open")
	$DoorAudio.play()

func _on_porte_zone_body_entered(body):
	var myround = 1
	
	if  doorstate == true and myround == 1:
		myround += myround
		get_tree().change_scene_to_file("res://level_2.tscn")
		
		
	elif doorstate == true and myround == 2:
		get_tree().change_scene_to_file("res://win_window.tscn")






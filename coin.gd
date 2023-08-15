extends Area2D

signal coins_collected

func _on_body_entered(body):
	$AnimationPlayer.play("bounce")
	emit_signal("coins_collected")
	set_collision_mask_value(1, false)    #pour collecter une seule fois le coin !!! pas 2 fois rapiide


func _on_animation_player_animation_finished(anim_name):
	queue_free()

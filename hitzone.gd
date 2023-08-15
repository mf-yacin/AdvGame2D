extends Area2D






func _on_body_entered(body):
	if body.name == "fireball":
		set_collision_mask_value(1, false)

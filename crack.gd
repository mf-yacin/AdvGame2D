extends Node2D


signal door_is_opened
func _ready():
	$AnimatedCrack.play("carck_up") 


func _on_crackzone_body_entered(body):
	var nomBody = body.name
	print(nomBody)
	#print("M pressed")
	$AnimatedCrack.play("crack_down")
	emit_signal("door_is_opened")
	$crackSound.play()
	$crackzone.set_collision_mask_value(1, false)
	






func _on_coins_collected():
	pass # Replace with function body.

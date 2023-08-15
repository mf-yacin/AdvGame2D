extends Node2D




func _on_saw_body_entered(body):
	body.ouch(position.x)

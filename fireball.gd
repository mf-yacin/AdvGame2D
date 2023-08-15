extends CharacterBody2D

const SPEEDFIREBALL = 800
var FireDirection = 1

func _ready():
	velocity.x = SPEEDFIREBALL * FireDirection

func _physics_process(delta):
	_ready()
	if is_on_wall():
		queue_free()
	move_and_slide()

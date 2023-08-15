extends CharacterBody2D


const SPEEDeagle = 70.0
@export var eagleDirection = -1

# Get the gravity from the project settings to be synced with RigidBody nodes.
#var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
func _ready():
	if eagleDirection == 1 :
		$Sprite2D.flip_h = true

func _physics_process(delta):
	if is_on_wall() :
		$Sprite2D.flip_h = !$Sprite2D.flip_h
		eagleDirection = eagleDirection * -1
	velocity.x = eagleDirection * SPEEDeagle


	move_and_slide()


func _on_eagle_hit_body_entered(body):
	if body.name == "player":
		body.ouch(position.x)
	elif body.name == "fireball":
		body.queue_free()
		queue_free()

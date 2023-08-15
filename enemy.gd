extends CharacterBody2D


const SPEED = 30
const JUMP_VELOCITY = -400.0
@export var enemyDirection = -1

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	
	if enemyDirection == 1 :
		$AnimatedSprite2D.flip_h = true
	$floor_checker.position.x = $CollisionShape2D.shape.get_size().x * enemyDirection
	var positionscane = $floor_checker.position.x
	print(positionscane)

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	
	if is_on_wall() or !$floor_checker.get_collider() and is_on_floor():
		enemyDirection = enemyDirection * -1
		$AnimatedSprite2D.flip_h = !$AnimatedSprite2D.flip_h 
		$floor_checker.position.x = $CollisionShape2D.shape.get_size().x * enemyDirection
	
	velocity.x = SPEED * enemyDirection


	move_and_slide()
	
	
func _on_hitzone_body_entered(body):
	if body.name == "player":
		body.ouch(position.x)
	elif body.name == "fireball":
		body.queue_free()
		get_node("AnimatedSprite2D").play("enemydead")
		$Timer.start()
		set_collision_mask_value(1, false)


		


func _on_timer_timeout():
	queue_free()

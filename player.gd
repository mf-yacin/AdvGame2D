extends CharacterBody2D

const SPEED = 100.0
const JUMP_VELOCITY = -300.0
const FIREBALL = preload("res://fireball.tscn")
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


   #func _ready():
#	get_node("AnimatedSprite2D").play("idle")

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		
	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		get_node("AnimatedSprite2D").play("jump")
		fire()
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")

	if direction:
		velocity.x = direction * SPEED

		if velocity.y == 0 :
			get_node("AnimatedSprite2D").play("run")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		if velocity.y == 0 :
			get_node("AnimatedSprite2D").play("idle")
	if velocity.y > 0 :
		get_node("AnimatedSprite2D").play("fall")
		
	if direction == -1:
		get_node("AnimatedSprite2D").flip_h = true
	elif direction == 1 : 
		get_node("AnimatedSprite2D").flip_h = false
	move_and_slide()
	fire()

func fire():
	if Input.is_action_just_pressed("fire"):
		var direction = 1 if not $AnimatedSprite2D.flip_h else -1
		var f = FIREBALL.instantiate()
		f.FireDirection = direction
		get_parent().add_child(f)
		f.position.y = position.y - 8
		f.position.x = position.x
	


func _on_fallzone_body_entered(body):
	get_tree().change_scene_to_file("res://game_over.tscn")
	Global.lives = 3
	

func ouch(enemyposx):
	set_modulate(Color(0.9, 0.1, 0.1, 0.94))
	var newposx = 560 + enemyposx     # proportionalité entre les 2 positions (décalage)!!!
	velocity.y = JUMP_VELOCITY * 0.5
	if position.x < newposx :
		velocity.x = -SPEED * 5
	elif  position.x > newposx :
		velocity.x = SPEED * 5
	
	Input.action_release("ui_left")       # blocker les touche de mouvement lors d'attack
	Input.action_release("ui_right")       # de l'enemie
	$Timer.start()



func _on_timer_timeout():
	set_modulate(Color(1, 1, 1, 1))
	Global.lose_live()
	#get_tree().change_scene_to_file("res://game_over.tscn")


func _on_traps_zone_body_entered(body):
	get_tree().change_scene_to_file("res://level_2.tscn")
	Global.lives = 3


func _on_spikeland_body_entered(body):
	print(body.name)
	if body.name == "player" :
		body.ouch(position.x)

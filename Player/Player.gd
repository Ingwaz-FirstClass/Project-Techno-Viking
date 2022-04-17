extends KinematicBody

const SPEED = 10
const GRAVITY = 100

var velocity = Vector3.ZERO

onready var sprite = $AnimatedSprite3D

func _physics_process(delta):
	movement(delta)

func movement(delta):
	var position = Vector3.ZERO
	
	if Input.is_action_pressed("ui_right"):
		position.x += 1
		
		sprite.flip_h = false
		sprite.play('Move')
	elif Input.is_action_pressed("ui_left"):
		position.x -= 1
		
		sprite.flip_h = true
		sprite.play('Move')
	elif Input.is_action_pressed("ui_down"):
		position.z += 1
		sprite.play('Move')
	elif Input.is_action_pressed("ui_up"):
		position.z -= 1
		sprite.play('Move')
	else:
		sprite.play('Idle')
	
	
	velocity.x = position.x * SPEED
	velocity.z = position.z * SPEED
	
	velocity.y -= GRAVITY * delta
	
	velocity = move_and_slide(velocity, Vector3.UP)

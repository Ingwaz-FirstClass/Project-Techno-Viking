extends KinematicBody

const GRAVITY = 100
const SPEED = 10

var velocity = Vector3.ZERO

func _physics_process(delta):
	movement(delta)

func movement(delta):
	var position = Vector3.ZERO
	
	if Input.is_action_pressed("ui_right"):
		position.x += 1
	if Input.is_action_pressed("ui_left"):
		position.x -= 1
	if Input.is_action_pressed("ui_down"):
		position.z += 1
	if Input.is_action_pressed("ui_up"):
		position.z -= 1
	
	velocity.x = position.x * SPEED
	velocity.z = position.z * SPEED
	velocity.y -= GRAVITY * delta
	
	velocity = move_and_slide(velocity, Vector3.UP)

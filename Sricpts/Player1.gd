extends CharacterBody3D

const MOUSE_SENS: float = 0.2
const MAX_SPEED: float = 15
const ACCEL: float = 10

var cur_speed: float = 0

#makes the cursor go bye bye
func  _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

#moves camera left/right 
func _input(event) -> void:
	if event is InputEventMouseMotion:
		rotation_degrees.y -= event.relative.x * MOUSE_SENS

#basic movement
func _physics_process(delta) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
	var input_direction: Vector2 = Input.get_vector("left", "right", "down", "up")
	var move_direction: Vector3 = (transform.basis * Vector3(input_direction.x, 0, -1 * input_direction.y)).normalized()
	
	if move_direction:
		cur_speed = move_toward(cur_speed, MAX_SPEED, ACCEL * delta)
		velocity.x = cur_speed * move_direction.x
		velocity.z = cur_speed * move_direction.z
	else:
		cur_speed = 0
		velocity.x = 0
		velocity.z = 0
	
	move_and_slide()

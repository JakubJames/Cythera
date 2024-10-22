extends CharacterBody3D


@export var speed: float = 2.0
@export var mouse_sens: float = 0.05
@export var cutscene: bool = false


func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("exit"):
		get_tree().quit()
	
	# Add the gravity.
	if not is_on_floor() and !cutscene:
		velocity += get_gravity() * delta
	else:
		velocity += get_gravity() * 0 * delta
		
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("left", "right", "forward", "backward")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction and !cutscene:
		velocity.x = direction.x * speed
		velocity.z = direction.z * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		velocity.z = move_toward(velocity.z, 0, speed)

	move_and_slide()


func _input(event):
	if event is InputEventMouseMotion:
		rotate_y(deg_to_rad(-event.relative.x * mouse_sens))
		$Head.rotate_x(deg_to_rad(-event.relative.y * mouse_sens))
		$Head.rotation.x = clamp($Head.rotation.x, deg_to_rad(-70), deg_to_rad(70))

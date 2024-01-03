class_name Player
extends CharacterBody2D


signal died

const SPEED = 300.0
const JUMP_VELOCITY = -800.0
const KILL_HEIGHT = 1000.0
const STARTING_POSITION = Vector2(195, 396)

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta: float) -> void:
	if global_position.y >= KILL_HEIGHT:
		die()

	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction: float = Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()


func die() -> void:
	velocity = Vector2(0, 0)
	position = STARTING_POSITION
	$AudioStreamPlayer.play(0.08)
	died.emit()

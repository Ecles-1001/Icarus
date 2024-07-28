extends CharacterBody2D

@onready var icarus_sprite_2d = %IcarusSprite2D

const SPEED = 450.0
const JUMP_VELOCITY = -600.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	if is_on_floor() and (velocity.x == 0):
		icarus_sprite_2d.animation = "idle"
	
	# Add the upward gravity.
	if not is_on_floor() and (velocity.y < 0):
		velocity.y += gravity * delta
		icarus_sprite_2d.play("jumping")
	
	# Add the downward gravity.
	if not is_on_floor() and (velocity.y >= 0):
		velocity.y += gravity * delta * 1.5
		icarus_sprite_2d.animation = "falling"

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	# Handle delayed jump.
	if Input.is_action_just_released("jump") and not is_on_floor() and (velocity.y < 0):
		velocity.y /= 2

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("moveLeft", "moveRight")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	
	if is_on_floor() and (velocity.x != 0):
		icarus_sprite_2d.animation = "running"

	if Input.is_action_pressed("moveLeft"):
		icarus_sprite_2d.flip_h = true

	if Input.is_action_pressed("moveRight"):
		icarus_sprite_2d.flip_h = false
	

	move_and_slide()

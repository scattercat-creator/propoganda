extends CharacterBody2D


const SPEED = 300
@onready var animated_sprite_2d = $AnimatedSprite2D
var running = true

# Get the gravity from the project settings to be synced with RigidBody nodes.
#var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _process(delta):
	var lastDirection
	var direction = Input.get_axis("ui_left", "ui_right")
	var updown = Input.get_axis("ui_up", "ui_down")
	var myVector = Vector2(direction, updown);
	# if there's input
	if running:
		if direction:
			if direction > 0:
				animated_sprite_2d.flip_h = false
			else:
				animated_sprite_2d.flip_h = true
			move_and_collide(myVector)
			#position.x += direction * SPEED * delta
			animated_sprite_2d.play("walk")
		elif updown:
			if updown > 0:
				animated_sprite_2d.play("down")
			else:
				animated_sprite_2d.play("up")
			move_and_collide(myVector)
			#position.y += updown * SPEED * delta
		else:
			animated_sprite_2d.play("default")
			animated_sprite_2d.flip_h = false
	else:
		animated_sprite_2d.play("default")
			#velocity.x = move_toward(velocity.x, 0, SPEED)
	

func setRunning(value):
	if(typeof(running) == 1):
		running = value
	#move_and_slide()

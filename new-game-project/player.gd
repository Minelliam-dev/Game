extends CharacterBody2D

var speed = 40  # speed in pixels/sec

var i = 0

func _physics_process(delta):
	if (Input.is_key_pressed(KEY_E)):
		print("EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE")
	
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity += (direction * speed) * delta
	
	position += velocity
	
	velocity = velocity.lerp(Vector2(0, 0), 0.3)
	
	Engine.max_fps = 0
	
	DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED)
	
	print(Engine.get_frames_per_second())

	i += (1/60)

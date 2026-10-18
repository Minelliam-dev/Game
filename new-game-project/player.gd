extends CharacterBody2D

var speed = 50  # speed in pixels/sec

var i = 0

func _physics_process(delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed

	if (i == 5):
		while true:
			pass

	move_and_slide()
	i += 1

extends CharacterBody2D

var speed = 1600  # speed in pixels/sec

var FPS = 60.0
var i = 0

var rng = RandomNumberGenerator.new()

func GetRandomNumber(a=0, b=1):
	return rng.randf_range(a, b)

func _physics_process(delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	
	velocity = (direction * speed)*delta
	
	FPS = (1/delta)
	
	if (i == 2):
		while true:
			if (GetRandomNumber(0, 20) == 20):
				break
	
	move_and_slide()
	i += 1

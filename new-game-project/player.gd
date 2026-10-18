extends CharacterBody2D

var speed = 20

var i = 0

@onready var player = $"AnimatedSprite2D"

func _physics_process(delta):
	if (Input.is_key_pressed(KEY_E)):
		print("EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE")
	
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity += (direction * speed) * delta
	
	if (direction.x == 1):
		player.animation = "right"
	elif (direction.x == -1):
		player.animation = "left"
	elif (direction.y == -1):
		player.animation = "up"
	elif (direction.y == 1):
		player.animation = "down"
	elif (direction == Vector2(0, 0)):
		player.animation = "down"
	
	position += velocity
	
	velocity = velocity.lerp(Vector2(0, 0), 0.3)

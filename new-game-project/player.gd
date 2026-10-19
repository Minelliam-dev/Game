extends Area2D

var speed = 20
var i = 0

@onready var player = $"AnimatedSprite2D"
var velocity = Vector2(0, 0)
var lvelocity = Vector2(0, 0)

var colliding = false

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
	
	if (!colliding):
		position += velocity
	if (colliding):
		position -= lvelocity
		
	velocity = velocity.lerp(Vector2(0, 0), 0.3)
	
	lvelocity = velocity

func _on_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	colliding = true

func _on_area_shape_exited(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	colliding = false

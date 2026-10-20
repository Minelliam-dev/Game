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
	
	if (direction == Vector2(0, 0)):
		player.animation = "down"
	if (direction == Vector2(0, 1)):
		player.animation = "down"
	if (direction == Vector2(0, -1)):
		player.animation = "up"
	if (direction == Vector2(1, 0)):
		player.animation = "right"
	if (direction == Vector2(-1, 0)):
		player.animation = "left"
	if (direction == Vector2(1, 1)):
		player.animation = "down-right"
	if (direction == Vector2(-1, -1)):
		player.animation = "up-right"
	if (direction == Vector2(1, 1)):
		player.animation = "down-left"
	if (direction == Vector2(-1, -1)):
		player.animation = "down-right"
	
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

extends Area2D

var speed = 20
var i = 0

@onready var hitbox: CollisionShape2D = $CollisionShape2D

func blocked_at(offset: Vector2) -> bool:
	var query = PhysicsShapeQueryParameters2D.new()
	query.shape = hitbox.shape
	query.transform = hitbox.global_transform
	query.transform.origin += offset
	query.collision_mask = collision_mask
	query.exclude = [get_rid()]
	query.collide_with_areas = true
	query.collide_with_bodies = true

	return not get_world_2d().direct_space_state.intersect_shape(
		query, 1
	).is_empty()

@onready var player = $"AnimatedSprite2D"
var velocity = Vector2(0, 0)
var lvelocity = Vector2(0, 0)

var colliding = false

var Moving_allowed = true

func _physics_process(delta):
	if (!Moving_allowed):
		return
	
	if (Input.is_key_pressed(KEY_E)):
		print("EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE")
	
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity += (direction * speed) * delta
	
	direction = direction.sign()
	
	if (direction == Vector2(0, 0)):
		player.play("down")
	elif (direction == Vector2(0, 1)):
		player.play("down")
	elif (direction == Vector2(0, -1)):
		player.play("up")
	elif (direction == Vector2(1, 0)):
		player.play("right")
	elif (direction == Vector2(-1, 0)):
		player.play("left")
	elif (direction == Vector2(1, 1)):
		player.play("down-right")
	elif (direction == Vector2(-1, -1)):
		player.play("up-left")
	elif (direction == Vector2(-1, 1)):
		player.play("down-left")
	elif (direction == Vector2(1, -1)):
		player.play("up-right")
	
	# Keep your current velocity calculation and movement scale.
	var movement = velocity
	
	if not blocked_at(Vector2(movement.x, 0)):
		global_position.x += movement.x
		force_update_transform()
	else:
		velocity.x = 0
	
	if not blocked_at(Vector2(0, movement.y)):
		global_position.y += movement.y
		force_update_transform()
	else:
		velocity.y = 0
	
	velocity = velocity.lerp(Vector2.ZERO, 0.3)

func _on_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	colliding = true

func _on_area_shape_exited(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	colliding = false

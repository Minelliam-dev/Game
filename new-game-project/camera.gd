extends Camera2D

@onready var target = get_node("../game scene/player")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	global_position = global_position.lerp(target.global_position, 0.9*delta)

class_name SpaceUtils


static func set_start_timer(timer: Timer, target: float, variance: float = 0.0) -> void:
	timer.start(target + randf_range(-variance, variance))


static func get_point_outside_rect(rect: Rect2, margin: float) -> Vector2:
	var r: Rect2 = rect.grow(margin)
	var side: int = randi_range(1, 4)
	var rand_x: float = randf_range(r.position.x, r.end.x)
	var rand_y: float = randf_range(r.position.y, r.end.y)
	match side:
		# top
		1: return Vector2(rand_x, r.position.y)
		# bottom
		2: return Vector2(rand_x, r.end.y)
		# left
		3: return Vector2(r.position.x, rand_y)
		# right
		_: return Vector2(r.end.x, rand_y)
		
	
static func random_point_in_rect(rect: Rect2, margin: float) -> Vector2:
	var r: Rect2 = rect.grow(margin)
	return Vector2(
		randf_range(r.position.x, r.end.x),
		randf_range(r.position.y, r.end.y)
	)

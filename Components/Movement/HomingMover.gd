class_name HomingMover


extends TargetedMover


func _physics_process(delta: float) -> void:
	var angle_to_target: float = _parent.transform.x.angle_to(
		_parent.global_position.direction_to(_target.global_position)
	)
	var step: float = min(abs(angle_to_target), deg_to_rad(rotation_speed_degrees) * delta)
	_parent.rotate(step * sign(angle_to_target))
	_parent.position += _parent.transform.x * speed * delta

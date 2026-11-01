extends Mover


const MARGIN_OUT: float = 80.0
const MARGIN_IN: float = 300.0


var _base_rotation_speed: float


func _ready() -> void:
	_base_rotation_speed = rotation_speed_degrees
	super()



func setup_velocity() -> void:
	var start_pos: Vector2 = SpaceUtils.get_point_outside_rect(
		_parent.get_viewport_rect(),
		 MARGIN_OUT
	)
	direction = start_pos.direction_to(SpaceUtils.random_point_in_rect(
		_parent.get_viewport_rect(), -MARGIN_IN
	))
	
	_velocity = speed * direction
	
	_parent.global_position = start_pos
	_parent.rotation_degrees = randf_range(0, 360)
	
	rotation_speed_degrees = _base_rotation_speed * randf_range(0.9, 1.1)
	rotation_speed_degrees *= sign(randf_range(-1, 1))

class_name TargetedMover
extends Mover

@export var target_group: String = "player"

var _target: Node2D

func _ready() -> void:
	_target = get_tree().get_first_node_in_group(target_group)
	super()

func setup_velocity() -> void:
	var target: Node2D = get_tree().get_first_node_in_group(target_group)
	assert(target, "TargetedMover has no target!")
	if target:
		_velocity = speed * _parent.global_position.direction_to(
			target.global_position
		)

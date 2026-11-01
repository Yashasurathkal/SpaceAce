extends Node2D



@export var projectile_scene: PackedScene
@export var input_shoot: String = "shoot"


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed(input_shoot):
		SignalHub.emit_spawn_pool_object(global_position, projectile_scene)

extends Node


@export var test_scene: PackedScene



var _pools: Dictionary[PackedScene, ScenePool] = {}



func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("test"):
		on_spawn_pool_object(
			Vector2(
				randf_range(400,1000),
				randf_range(300,700),
			),
			test_scene
		)

func _ready() -> void:
	SignalHub.spawn_pool_object.connect(on_spawn_pool_object)

func on_spawn_pool_object(position: Vector2, scene: PackedScene) -> void:
	call_deferred("spawn_deferred", position, scene)

func spawn_deferred(position: Vector2, scene: PackedScene) -> void:
	if !_pools.has(scene):
		var new_pool: ScenePool = ScenePool.new(5, scene, self)
		_pools[scene] = new_pool

	_pools[scene].activate_next(position)

extends Node

signal spawn_pool_object(position: Vector2, scene: PackedScene)
signal player_take_damage(damage: int)
signal player_health_boost(boost: int)
signal points_scored(points: int)


func emit_spawn_pool_object(position: Vector2, scene: PackedScene):
	spawn_pool_object.emit(position,scene)

func emit_player_take_damage(damage: int) -> void:
	player_take_damage.emit(damage)

func emit_player_health_boost(boost: int) -> void:
	player_health_boost.emit(boost)

func emit_points_scored(points: int) -> void:
	points_scored.emit(points)

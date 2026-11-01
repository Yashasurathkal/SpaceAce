class_name EnemyBase

extends PathFollow2D


@export var speed: float = 100.0
@export var explosion_scene: PackedScene
@export var powerup_scene: PackedScene
@export var powerup_chance: float = 50.0
@export var missile_scene: PackedScene
@export var missile_chance: float = 100.0
@export var points: int = 0


@onready var health_bar: HealthBar = $HealthBar
@onready var sprite_2d: Sprite2D = $Sprite2D



func create_random_chance_scene(scene: PackedScene, chance: float) -> void:
	if scene and randf() * 100.0 < chance:
		SignalHub.emit_spawn_pool_object(global_position, scene)


func _physics_process(delta: float) -> void:
	progress += speed * delta
	if progress_ratio > 0.99:
		queue_free()


func _on_hitbox_hit(damage: int) -> void:
	health_bar.take_damage(damage)




func _on_health_bar_died() -> void:
	SignalHub.emit_spawn_pool_object(global_position, explosion_scene)
	create_random_chance_scene(powerup_scene, powerup_chance)
	create_random_chance_scene(missile_scene, missile_chance)
	var tween: Tween = create_tween()
	tween.tween_property(sprite_2d, "modulate", Color("#ff0000"), 0.25)
	tween.tween_callback(queue_free)
	SignalHub.emit_points_scored(points)
	

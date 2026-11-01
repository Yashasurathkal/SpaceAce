class_name BaseProjectile


extends Poolable

@onready var hitbox: HitBox = $Hitbox
@onready var life_timer: Timer = $LifeTimer


@export var explosion_margin: float = 40.0
@export var explosion_scene: PackedScene
@export var points: int = 0



var _mover: Mover


func _ready() -> void:
	for c in get_children():
		if c is Mover:
			_mover = c
			break
	assert(_mover, "No mover on base projectile")


func activate() -> void:
	super()
	life_timer.start()
	_mover.setup_velocity()
	hitbox.reset()


func explode(collider_position: Vector2) -> void:
	if !explosion_scene: return
	var direction: Vector2 = global_position.direction_to(collider_position)
	var explosion_position: Vector2 = global_position + direction * explosion_margin
	SignalHub.emit_spawn_pool_object(
		explosion_position, explosion_scene
	)


func _on_screen_notifier_screen_exited() -> void:
	if visible:
		deactivate()

func _on_life_timer_timeout() -> void:
	deactivate()

func _on_hitbox_died(collided_with: Area2D) -> void:
	SignalHub.emit_points_scored(points)
	explode(collided_with.global_position)
	deactivate()

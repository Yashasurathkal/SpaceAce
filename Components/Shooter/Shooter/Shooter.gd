extends Node2D


@export var shoot_wait: float = 3.0
@export var shoot_variance: float = 1.0
@export var projectile_scene: PackedScene
@export var launch_effect: AudioStream

@onready var shoot_timer: Timer = $ShootTimer
@onready var launch_sound: AudioStreamPlayer2D = $LaunchSound


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	launch_sound.stream = launch_effect
	restart_timer()


func restart_timer() -> void:
	SpaceUtils.set_start_timer(shoot_timer, shoot_wait, shoot_variance)


func _on_shoot_timer_timeout() -> void:
	launch_sound.play()
	SignalHub.emit_spawn_pool_object(global_position,projectile_scene)
	restart_timer()

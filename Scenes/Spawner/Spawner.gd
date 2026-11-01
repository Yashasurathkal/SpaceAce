extends Node


@export var scene: PackedScene
@export var enabled: bool = true
@export var wait_time: float = 5.0
@onready var timer: Timer = $Timer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if !enabled: return
	timer.start(wait_time)


func _on_timer_timeout() -> void:
	if !scene: return
	SignalHub.emit_spawn_pool_object(Vector2.ZERO, scene)

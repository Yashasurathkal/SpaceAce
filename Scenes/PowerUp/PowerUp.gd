class_name PowerUp

extends Poolable

@export var boost: int = 25

@onready var life_timer: Timer = $LifeTimer

func activate() -> void:
	super()
	life_timer.start()


func _on_life_timer_timeout() -> void:
	deactivate()


func _on_detection_area_entered(_area: Area2D) -> void:
	SignalHub.emit_player_health_boost(boost)
	deactivate()

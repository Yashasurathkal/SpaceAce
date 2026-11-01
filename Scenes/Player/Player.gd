class_name Player
extends Node2D



func _on_hitbox_hit(damage: int) -> void:
	SignalHub.emit_player_take_damage(damage)

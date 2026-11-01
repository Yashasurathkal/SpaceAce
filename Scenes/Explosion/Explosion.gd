class_name Explosion

extends Poolable

@onready var cpu_particles_2d: CPUParticles2D = $CPUParticles2D
@onready var sound: AudioStreamPlayer = $Sound

func activate() -> void:
	super()
	cpu_particles_2d.restart()
	sound.play()



func _on_audio_stream_player_finished() -> void:
	deactivate()

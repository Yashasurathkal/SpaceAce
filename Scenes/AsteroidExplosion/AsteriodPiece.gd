
class_name AsteroidPiece


extends Node2D


@export var speed: float = 150.0
@export var rotation_speed_degrees: float = 360.0
@export var textures: Array[Texture2D] = []


@onready var sprite_2d: Sprite2D = $Sprite2D


var _velocity: Vector2 = Vector2.RIGHT
var _rotation_speed_degrees: float = 0.0
var _start_position: Vector2


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_start_position = position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += _velocity * delta
	rotation_degrees += _rotation_speed_degrees * delta
	

func reset() -> void:
	position = _start_position
	_rotation_speed_degrees = rotation_speed_degrees * randf_range(0.6,1.2)
	_rotation_speed_degrees *= sign(randf_range(-1,1))
	_velocity = position.normalized() * speed * randf_range(0.6,1.2)
	sprite_2d.texture = textures.pick_random()

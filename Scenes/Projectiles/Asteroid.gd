extends BaseProjectile


@export var textures: Array[Texture2D] = []
@onready var sprite_2d: Sprite2D = $Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super()
	sprite_2d.texture = textures.pick_random()
	

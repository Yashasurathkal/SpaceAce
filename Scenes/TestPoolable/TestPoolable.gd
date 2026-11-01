extends Poolable
class_name TestPoolable


static var count: int = 1


@onready var label: Label = $Label
@onready var timer: Timer = $Timer


func _ready() -> void:
	label.text = str(count)
	count += 1
	timer.start()

func activate() -> void:
	super()
	timer.start()




func _on_timer_timeout() -> void:
	deactivate()

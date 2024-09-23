extends Label
class_name Mini_Score

@export var float_speed: float = 10
@export var lifetime: float = 1

@onready var timer: Timer = $Timer

var score: int

func _ready() -> void:
	text = "+"+str(score)
	timer.start(lifetime)

func _process(delta: float) -> void:
	position.y -= float_speed * delta

func timeout() -> void:
	queue_free()

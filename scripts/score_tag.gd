extends Label
class_name Score_Tag

@export var time_per_increment: float = 0.01

@onready var timer: Timer = $Timer

var cur_score: int

func _ready() -> void:
	cur_score = Globals.score
	set_score()

func _process(delta: float) -> void:
	if (cur_score < Globals.score):
		timer.start(time_per_increment)

func timeout() -> void:
	cur_score += 10
	set_score()

func set_score():
	text = "score: " + str(cur_score)

extends CharacterBody2D
class_name Capybara

@export var move_speed: float = 300


func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	##Movement Controls
	var input_direction = Input.get_axis("left", "right")
	velocity = transform.x * input_direction * move_speed
	
	move_and_slide()

extends CharacterBody2D
class_name Capybara

@export var move_speed: float = 200
@export var friction: float = 2.5

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	##Movement Controls
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity = transform.x * direction * move_speed
	else:
		velocity.x = lerp(velocity.x, direction * move_speed, delta * friction)
	
	move_and_slide()

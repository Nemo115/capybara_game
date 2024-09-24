extends CharacterBody2D
class_name Capybara

@export var move_speed: float = 200
@export var friction: float = 2.5

@onready var animated_sprite = $AnimatedSprite2D

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	##Movement Controls
	var direction = Input.get_axis("left", "right")
	var camera = Globals.camera
	
	# Flip the sprite and play animation
	if direction > 0:
		animated_sprite.play("walk")
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.play("walk")
		animated_sprite.flip_h = true
	else:
		animated_sprite.play("default")
	
	#Apply movement
	if direction:
		velocity = transform.x * direction * move_speed
	else:
		velocity.x = lerp(velocity.x, direction * move_speed, delta * friction)
	
	#If camera border reached stop movement
	if (position.x + velocity.x) > camera.calculate_boundary_right(70).x or (
		position.x + velocity.x) < camera.calculate_boundary_left(70).x:
		velocity.x = 0
	
	
	move_and_slide()

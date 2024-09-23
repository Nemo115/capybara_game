extends Area2D
class_name Falling_OBJ

@export var score: int = 100

@export var fall_speed: float = 50
@export var falling: bool = true

@export var in_tower: bool

@export var land_impact: float = 5

func _physics_process(delta: float) -> void:
	if falling:
		position.y += fall_speed * delta * 9.8

func _on_area_entered(area: Area2D) -> void:
	print("area detected")
	if area is Falling_OBJ:
		if area.in_tower and area == Globals.tower.get_highest_obj():
			#add to tower
			falling = false
			Globals.tower.add_obj(self)

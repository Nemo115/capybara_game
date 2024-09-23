extends Node2D
class_name Tower

@export var joint: PackedScene

@export var obj_tower: Array[Falling_OBJ]

func _ready() -> void:
	Globals.tower = self

func add_obj(obj: Falling_OBJ):
	if not obj.in_tower:
		var top_obj = get_highest_obj()
		
		add_child(obj)
		obj.in_tower = true
		
		obj_tower.append(obj)

#Look through the objects and find which one has the smallest y value => greatest position
func get_highest_obj()->Falling_OBJ:
	return obj_tower[len(obj_tower) - 1]

#Calculate the middle position of the tower
func get_middle_pos():
	pass

func _process(delta: float) -> void:
	pass

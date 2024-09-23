extends Node2D
class_name Tower

@export var joint: PackedScene

@export var obj_tower: Array[Falling_OBJ]

signal added_obj

func _enter_tree() -> void:
	Globals.tower = self

func add_obj(obj: Falling_OBJ):
	if not obj.in_tower:
		var top_obj = get_highest_obj()
		
		add_child(obj)
		obj.in_tower = true
		
		obj_tower.append(obj)
		
		Globals.score += obj.score
		print("score: ", Globals.score)
		
		added_obj.emit()

#Look through the objects and find which one has the smallest y value => greatest position
func get_highest_obj()->Falling_OBJ:
	return obj_tower[len(obj_tower) - 1]

func _process(delta: float) -> void:
	pass

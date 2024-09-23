extends Node2D
class_name Tower

@export var obj_tower: Array[Falling_OBJ]
@export var mini_score: PackedScene

signal added_obj

func _enter_tree() -> void:
	Globals.tower = self

func add_obj(obj: Falling_OBJ):
	if not obj.in_tower:
		##Add object to tower
		var top_obj = get_highest_obj()
		obj.reparent(self, true)
		obj.in_tower = true
		obj_tower.append(obj)
		Globals.score += obj.score
		added_obj.emit()
		
		##Show mini score
		var popup: Mini_Score = mini_score.instantiate()
		popup.score = obj.score
		Globals.game_tree.add_child(popup)
		popup.global_position = obj.global_position + Vector2(20,0)

#Look through the objects and find which one has the smallest y value => greatest position
func get_highest_obj()->Falling_OBJ:
	return obj_tower[len(obj_tower) - 1]

func _process(delta: float) -> void:
	pass

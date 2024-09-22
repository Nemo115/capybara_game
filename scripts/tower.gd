extends Node2D
class_name Tower

var obj_tower: Array[Falling_Object]

func add_obj(obj: Falling_Object):
	add_child(obj)
	obj_tower.append(obj)
	print("Added obj to tower")

#Look through the objects and find which one has the smallest y value => greatest position
func get_highest_obj():
	pass

#Calculate the middle position of the tower
func get_middle_pos():
	pass

func _process(delta: float) -> void:
	
	
	pass

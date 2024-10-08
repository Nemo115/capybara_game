extends Node
class_name Spawner

#Using an array so we can include other things
@export var objects: Array[PackedScene]

var spawn_coord: Vector2
var obj_list_len: int

func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("spawn"):
		spawn_obj(0)
		print("spawned")

func _process(delta: float) -> void:
	spawn_coord = Globals.camera.calculate_spawn_coord(20)

func spawn_obj(i:int = 0):
	var obj: Falling_OBJ = objects[i].instantiate()
	obj.global_position = spawn_coord
	Globals.game_tree.add_child(obj)

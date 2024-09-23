extends Camera2D
class_name Game_Camera

@export var target_obj: Falling_OBJ
@export var smoothing: float = 0.08

func _ready() -> void:
	Globals.tower.added_obj.connect(new_obj)

func _physics_process(delta: float) -> void:
	if target_obj:
		position = lerp(position, target_obj.position, smoothing)

#Calculate where the spawner needs to be above the camera view
#This function is accessed in the spawner.gd script
func calculate_spawn_coord(offset: float = 0) -> Vector2:
	var center_coord: Vector2 = get_screen_center_position()
	var screen_height: float = get_viewport_rect().size.y + (1 - zoom.y) * get_viewport_rect().size.y
	var screen_width: float = get_viewport_rect().size.x + (1 - zoom.x) * get_viewport_rect().size.x
	
	return Vector2(center_coord.x, center_coord.y - (screen_height/2) - offset)

func zoom_out():
	var tween: Tween = get_tree().create_tween()
	tween.tween_property(self, "zoom", zoom - Vector2(0.01, 0.01), 0.5)
	print("zoom changed")

func new_obj():
	zoom_out()
	target_obj = Globals.tower.get_highest_obj()

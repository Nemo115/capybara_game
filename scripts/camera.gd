extends Camera2D
class_name Game_Camera

func _process(delta):
	if Input.is_action_just_pressed("spawn"):
		zoom_out()
		print("zooming")

#Calculate where the spawner needs to be above the camera view
#This function is accessed in the spawner.gd script
func calculate_spawn_coord(offset: float = 0) -> Vector2:
	var center_coord: Vector2 = get_screen_center_position()
	var screen_height: float = get_viewport_rect().size.y
	
	return Vector2(center_coord.x, center_coord.y - (screen_height/2) - offset)

func zoom_out():
	var tween: Tween = get_tree().create_tween()
	tween.tween_property(self, "zoom", zoom - Vector2(0.01, 0.01), 0.5)
	print("zoom changed")

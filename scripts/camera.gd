extends Camera2D
class_name Game_Camera

@export var target_obj: Falling_OBJ
@export var smoothing: float = 0.08

##Camera Shake variables
@export_group("Camera Shake")

@export var randomStrength: float = 30.0
@export var shakeFade: float = 5.0

var rng = RandomNumberGenerator.new()
var shake_strength: float = 0.0

func _enter_tree() -> void:
	Globals.camera = self

func _ready() -> void:
	Globals.tower.added_obj.connect(new_obj)

func _physics_process(delta: float) -> void:
	if target_obj:
		position = lerp(position, target_obj.position, smoothing)
	
	##Camera Shake Logic
	if shake_strength > 0:
		shake_strength = lerp(shake_strength, 0.0, shakeFade * delta)
		offset = randomOffset()

##Camera Shake Functions
func apply_shake(strength: float):
	shake_strength = strength
func randomOffset() -> Vector2:
	return Vector2(rng.randf_range(-shake_strength, shake_strength), rng.randf_range(-shake_strength, shake_strength))

#Calculate where the spawner needs to be above the camera view
#This function is accessed in the spawner.gd script
func calculate_spawn_coord(offset: float = 0) -> Vector2:
	var center_coord: Vector2 = get_screen_center_position()
	var screen_height: float = get_viewport_rect().size.y + (1 - zoom.y) * get_viewport_rect().size.y
	var screen_width: float = get_viewport_rect().size.x + (1 - zoom.x) * get_viewport_rect().size.x
	
	return Vector2(center_coord.x, center_coord.y - (screen_height/2) - offset)

func zoom_out():
	var tween: Tween = get_tree().create_tween()
	tween.tween_property(self, "zoom", clamp(zoom - Vector2(0.01, 0.01), Vector2(0.45, 0.45), zoom), 0.5)
	print("zoom changed")

func new_obj():
	zoom_out()
	target_obj = Globals.tower.get_highest_obj()
	apply_shake(Globals.tower.get_highest_obj().land_impact)

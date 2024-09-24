extends CanvasLayer
class_name Canvas

@export var chromatic_aberration: ColorRect

func _enter_tree() -> void:
	Globals.canvas = self

func faze_aberration():
	var tween: Tween = get_tree().create_tween()
	tween.tween_method(set_abberation, 0.0, 12.0, 0.05)

func set_abberation(value: float):
	chromatic_aberration.material.set_shader_parameter("r_displacement", Vector2(value,0));
	chromatic_aberration.material.set_shader_parameter("b_displacement", Vector2(-value,0));

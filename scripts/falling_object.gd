extends RigidBody2D
class_name Falling_Object

'''
This is where the oranges, etc are generalized.
'''

@export var in_tower = false
@export var tower: Tower

@export var partner: Falling_Object
@export var grav_force: float = 20

func _ready() -> void:
	#Enable rigidbody collision detection
	contact_monitor = true
	max_contacts_reported = 30

func _physics_process(delta: float) -> void:
	if partner:
		#Apply constant forces
		constant_force = calc_dir() * grav_force
		#print(calc_dir())

func _on_body_entered(body: Node) -> void:
	if body is Falling_Object:
		if body.in_tower:
			body.tower.add_obj(self)
			partner = body

func calc_dir()->Vector2:
	var dir: Vector2 = partner.global_position - global_position
	var abs_val: float = sqrt(dir.x**2 + dir.y**2)
	return ((1/abs_val) * dir)

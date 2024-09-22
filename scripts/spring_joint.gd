extends DampedSpringJoint2D
class_name Spring_Joint

func connect_obj(a: Falling_Object, b: Falling_Object):
	node_a = a.get_path()
	node_b = b.get_path()

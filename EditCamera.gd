extends Camera

var RAY_LENGTH = 500

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _physics_process(delta):
	
	pass

func _input(event):
# Mouse in viewport coordinates
	if event is InputEventMouseButton and event.is_pressed():
		print("Mouse Click at: ", event.position)
		var obj = get_object_under_mouse()
		if obj:
			print("Object: " + obj["collider"].name)

# cast a ray from camera at mouse position, and get the object colliding with the ray
func get_object_under_mouse():
	var mouse_pos = get_viewport().get_mouse_position()
	var ray_from = self.project_ray_origin(mouse_pos)
	var ray_to = ray_from + self.project_ray_normal(mouse_pos) * RAY_LENGTH
	var space_state = get_world().direct_space_state
	var selection = space_state.intersect_ray(ray_from, ray_to)
	return selection
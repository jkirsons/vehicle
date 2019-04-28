
extends Spatial

export(Array, Mesh) var tiles
var grid = []
var ray_length = 500

export var vbox : NodePath
export var gui_tile : PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	var is_editor = Engine.editor_hint

	# remove list children
	for child in get_node(vbox).get_children():
		child.queue_free()
	
	tiles.clear()
	for child in get_children():
		tiles.append(child.mesh)
		var list_tile = gui_tile.instance()
		var mi = list_tile.find_node("MeshInstance", true)
		mi.mesh = child.mesh
		get_node(vbox).add_child(list_tile)


func _input(event):
# Mouse in viewport coordinates
	if event is InputEventMouseButton and event.is_pressed() and event.button_index == BUTTON_LEFT:
		print("Mouse Click at: ", event.position)
		var obj = get_object_under_mouse()
		if obj:
			print("Object: " + obj["collider"].name)
			print("Position: " + str(obj["position"]))
			edit_tile(int(ceil(obj["position"].x/3)), int(ceil(obj["position"].z/3)))

# cast a ray from camera at mouse position, and get the object colliding with the ray
func get_object_under_mouse():
	var mouse_pos = get_viewport().get_mouse_position()
	var ray_from = get_node("../Camera").project_ray_origin(mouse_pos)
	var ray_to = ray_from + get_node("../Camera").project_ray_normal(mouse_pos) * ray_length
	var space_state = get_world().direct_space_state
	var selection = space_state.intersect_ray(ray_from, ray_to)
	return selection
	
func edit_tile(x, y):
	print("Edit: "+str(x)+", "+str(y))
	pass
extends MeshInstance
class_name GroundTile

var minSize : Vector3
var maxSize : Vector3
var aabb : AABB

	
# Called when the node enters the scene tree for the first time.
func _ready():
	
	if !find_node("StaticBody", true):
		create_trimesh_collision()
		print("Created Trimesh Collider")
	_calcDimensions()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _calcDimensions():
	# Bounding size of mesh
	#for points in mesh.surface_get_arrays(Mesh.PRIMITIVE_POINTS):
	aabb = get_aabb()
	print("aabb: "+str(aabb))

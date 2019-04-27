extends MeshInstance

var minSize : Vector3
var maxSize : Vector3
	
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
	var pointArray = mesh.surface_get_arrays(Mesh.PRIMITIVE_POINTS)
	var points = pointArray[0]
	if points is PoolVector3Array:
		if minSize == Vector3.ZERO && maxSize == Vector3.ZERO:
			minSize = points[0]
			maxSize = points[0]
		for point in points:
			minSize.x = min(minSize.x, point.x)
			minSize.y = min(minSize.y, point.y)
			minSize.z = min(minSize.z, point.z)
			maxSize.x = max(maxSize.x, point.x)
			maxSize.y = max(maxSize.y, point.y)
			maxSize.z = max(maxSize.z, point.z)
		print("Array: " + str(points.size()))
	print("min: " +str(minSize))
	print("max: " +str(maxSize))

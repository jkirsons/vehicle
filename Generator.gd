tool
extends Spatial

export(Array, Mesh) var tiles

# Called when the node enters the scene tree for the first time.
func _ready():
	var is_editor = Engine.editor_hint
	#print("Hello")
	
	var mi = MeshInstance.new()
	mi.mesh = tiles[0]
	mi.name = "Tile1"
	self.add_child(mi)
	mi.set_owner(self)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

import glob
import bpy

# Fix Kenney's 3D objects (http://kenney.itch.io/kenney-donation) for GODOT

# To run:
# > cd <path to assets>
# > blender -b -P fixQuads.py

# https://docs.blender.org/api/blender_python_api_2_59_0/bpy.ops.export_scene.html

#~/Documents/GoDot/vehicle/Models/roadTile_001.obj

for obj in glob.glob('*.obj'):
  bpy.ops.import_scene.obj(filepath=obj)
  model = bpy.data.objects[len(bpy.data.objects) - 1]

  bpy.context.scene.objects.active = model

#  bpy.ops.object.mode_set(mode='EDIT')
  
  bpy.ops.transform.translate(value=(-1.5, -1.5, 0.0))
  bpy.ops.object.transform_apply(location = True, scale = True, rotation = True)
  
  bpy.ops.export_scene.obj(filepath=obj, use_selection=True, use_triangles=True)

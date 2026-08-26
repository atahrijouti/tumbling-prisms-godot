extends Node3D

@export var prism_count: int = 10

@onready var prisms: Node3D = $Prisms

func _ready() -> void:
	for i in prism_count:
		var prism := MeshInstance3D.new()
		var mesh = CylinderMesh.new()

		mesh.height = 1.0
		mesh.radial_segments = 4 + i

		prism.mesh = mesh
		prism.position = Vector3(0, 0, 4 + i)
		prisms.add_child(prism)

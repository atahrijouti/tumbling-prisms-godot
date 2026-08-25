extends Node3D

@export var prism_count: int = 4

@onready var prisms: Node3D = $Prisms

func _ready() -> void:
	var eight := MeshInstance3D.new()
	var mesh = CylinderMesh.new()

	mesh.height = 1.0
	mesh.radial_segments = 8

	eight.mesh = mesh
	eight.position = Vector3(0, 0, -4)
	prisms.add_child(eight)

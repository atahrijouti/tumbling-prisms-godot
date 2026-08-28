class_name Prism extends Node3D

static var _scene: PackedScene

@export_range(4, 32) var segments: int = 4:
	set(value):
		segments = maxi(4, value)
		if is_node_ready():
			applySegments()

@onready var translationNode: Node3D = $translationNode
@onready var redressNode: Node3D = $translationNode/rotationNode/adjustXNode/redressNode
@onready var meshInstance: MeshInstance3D = $translationNode/rotationNode/adjustXNode/redressNode/MeshInstance3D


static func create(segments: int) -> Prism:
	if _scene == null:
		_scene = load("res://scenes/Prism.tscn")
	var prism: Prism = _scene.instantiate()
	prism.segments = segments
	return prism

func _ready() -> void:
	applySegments()

func applySegments() -> void:
	var mesh := meshInstance.mesh as CylinderMesh
	if mesh == null:
		mesh = CylinderMesh.new()
		mesh.height = 0.5
		meshInstance.mesh = mesh
	mesh.radial_segments = segments

	var angleSum := (segments - 2) * PI
	var redressAngle := PI / 2.0 - angleSum / segments / 2.0
	var maxAngle = PI - angleSum / segments

	redressNode.rotation.z = -redressAngle
	translationNode.position.z = segments - 2

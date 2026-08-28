class_name Prism extends Node3D

static var _scene: PackedScene

@export_range(4, 32) var _segments: int = 4:
	set(value):
		_segments = maxi(4, value)
		if is_node_ready():
			applySegments()

@export_range(0, 1) var _progress: float = 0.0:
	set(value):
		_progress = clampf(value, 0, 1)
		if is_node_ready():
			applyProgress(_progress)

var maxAngle: float = PI;

@onready var meshInstance: MeshInstance3D = %MeshInstance3D

@onready var translationNode: Node3D = %translationNode
@onready var redressNode: Node3D = %redressNode
@onready var rotationNode: Node3D = %rotationNode
@onready var adjustXNode: Node3D = %adjustXNode


static func create(segments: int) -> Prism:
	if _scene == null:
		_scene = load("res://scenes/Prism.tscn")
	var prism: Prism = _scene.instantiate()
	prism._segments = segments
	return prism

func _ready() -> void:
	applySegments()
	applyProgress(_progress)

func applySegments() -> void:
	var mesh := meshInstance.mesh as CylinderMesh
	if mesh == null:
		mesh = CylinderMesh.new()
		mesh.height = 0.5
		meshInstance.mesh = mesh
	var radius := 0.5 / sin(PI / _segments)
	mesh.radial_segments = _segments
	mesh.top_radius = radius
	mesh.bottom_radius = radius
	meshInstance.position.y = radius

	var angleSum := (_segments - 2) * PI
	var redressAngle := PI / 2.0 - angleSum / _segments / 2.0
	maxAngle = PI - angleSum / _segments

	redressNode.rotation.z = -redressAngle
	adjustXNode.position.x = -1
	translationNode.position.z = _segments - 2

func applyProgress(progress: float) -> void:
	var angle = -maxAngle * progress
	rotationNode.rotation.z = angle
	translationNode.position.x = -progress

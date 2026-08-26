@tool
extends EditorScript

var prism_count := 8

func _run() -> void:
	var prisms := get_scene().get_node("Prisms") as Node3D
	for i in prism_count:
		var segments = 4 + i
		var prism := MeshInstance3D.new()
		var mesh = CylinderMesh.new()

		mesh.height = 0.5
		mesh.radial_segments = segments
		prism.name = "Prism"
		prism.mesh = mesh
		prism.rotation.x = PI / 2

		var angleSum = (segments - 2) * PI
		var redressAngle = (PI / 2) - angleSum / segments / 2
		# var maxAngle = PI - angleSum / segments


		var translationAnchor = Node3D.new()
		translationAnchor.name = "TranslationAnchor"
		var mirrorAnchor = Node3D.new()
		mirrorAnchor.name = "MirrorAnchor"
		var rotationAnchor = Node3D.new()
		rotationAnchor.name = "RotationAnchor"
		var adjustXAnchor = Node3D.new()
		adjustXAnchor.name = "AdjustXAnchor"
		var redressAnchor = Node3D.new()
		redressAnchor.name = "RedressAnchor"

		redressAnchor.rotation.z += -redressAngle
		redressAnchor.add_child(prism)
		adjustXAnchor.add_child(redressAnchor)
		rotationAnchor.add_child(adjustXAnchor)
		translationAnchor.add_child(rotationAnchor)
		translationAnchor.add_child(mirrorAnchor)


		translationAnchor.position.z = i

		prisms.add_child(translationAnchor)
		own_recursive(translationAnchor, get_scene())
		translationAnchor.name = "Prism " + str(segments)


func own_recursive(node: Node, scene_owner: Node) -> void:
	node.owner = scene_owner
	for child in node.get_children():
		own_recursive(child, scene_owner)

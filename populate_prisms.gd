@tool
extends EditorScript

var prism_count := 8

func _run() -> void:
	var prisms := get_scene().get_node("Prisms") as Node3D
	for i in prism_count:
		var segments = i + 4
		var prismNode = Prism.create_prism(segments)
		prismNode .position.z = i
		prisms.add_child(prismNode)
		Utils.own_recursive(prismNode, get_scene())
		prismNode.name = "Prism " + str(segments)

class_name Utils
extends RefCounted

static func own_recursive(node: Node, scene_owner: Node) -> void:
	node.owner = scene_owner
	for child in node.get_children():
		own_recursive(child, scene_owner)

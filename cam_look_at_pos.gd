@tool
extends EditorScript
# var camera_position = Vector3(-3, 1, -3)

func _run() -> void:
	var cam := get_scene().get_node("Camera3D") as Camera3D
	var prisms := get_scene().get_node("Prisms") as Node3D
	cam.look_at_from_position(cam.position, _center_of(prisms), Vector3.UP)
	print("aimed camera")

func _center_of(root: Node3D) -> Vector3:
	var sum := Vector3.ZERO
	var count := 0
	for child in root.get_children():
		if child is Node3D:
			sum += (child as Node3D).global_position
			count += 1
	if count == 0:
		return root.global_position
	return sum / count

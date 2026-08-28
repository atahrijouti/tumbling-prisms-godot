@tool
extends EditorScript
# var camera_position = Vector3(-3, 1, -3)

func _run() -> void:
	var cam := get_scene().get_node("Camera3D") as Camera3D
	var prisms := get_scene().get_node("Prisms") as Node3D
	var centerOfPrisms = _center_of(prisms)
	# cam.look_at_from_position(cam.position, centerOfPrisms, Vector3.UP)
	cam.look_at_from_position(cam.position, Vector3(-2.469487806639386, 1.0630914597854084, 4.916779672742233), Vector3.UP)
	print(centerOfPrisms)

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

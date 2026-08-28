extends Node3D

@export var prism_count: int = 10

@onready var prisms: Node3D = $Prisms

@export_range(0, 1) var _progress: float = 0.0:
	set(value):
		_progress = clampf(value, 0, 1)
		if is_node_ready():
			for prism in prisms.get_children():
				prism.applyProgress(_progress)

func _ready() -> void:
	for i in prism_count:
		var segments = i + 4
		var prismNode = Prism.create(segments)
		prisms.add_child(prismNode)
		Utils.own_recursive(prismNode, self)
		prismNode.name = "Prism " + str(segments)

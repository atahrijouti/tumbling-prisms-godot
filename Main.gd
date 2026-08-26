extends Node3D

@export var prism_count: int = 10

@onready var prisms: Node3D = $Prisms

func _ready() -> void:
	for i in prism_count:
		var segments = i + 4
		var prismNode = Prism.create_prism(segments)
		prismNode .position.z = i
		prisms.add_child(prismNode)
		Utils.own_recursive(prismNode, self)
		prismNode.name = "Prism " + str(segments)

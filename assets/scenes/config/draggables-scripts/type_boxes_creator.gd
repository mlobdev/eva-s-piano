extends Node

# Create type boxes

func _ready() -> void:
	# Duplicate the original box
	for i in range(1, 9):
		var box := $"../TypeBoxesContainer/TypeBoxContainer0".duplicate()
		box.name = "TypeBoxContainer" + str(i)
		$"../TypeBoxesContainer".add_child(box)

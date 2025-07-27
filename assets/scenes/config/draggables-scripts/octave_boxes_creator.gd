extends Node

# Create octave boxes

func _ready() -> void:
	# Duplicate the original box
	for i in range(1, 9):
		var box : Control = $"../OctaveBoxesContainer/OctaveBoxContainer0".duplicate()
		box.name = "OctaveBoxContainer" + str(i)
		$"../OctaveBoxesContainer".add_child(box)

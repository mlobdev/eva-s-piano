extends Node

# Create instrument boxes

func _ready() -> void:
	# Duplicate the original box
	for i in range(1, 9):
		var box : InsBox = $"../InstrumentsBoxesContainer/InstrumentBoxContainer0".duplicate()
		box.name = "InstrumentBoxContainer" + str(i)
		$"../InstrumentsBoxesContainer".add_child(box)

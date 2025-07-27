extends Node

var gpm : GPM

func _ready() -> void:
	# Reference to GlobalPianoManager
	gpm = get_node("../../GlobalPianoManager")
	# Connects the signals of each one of the OctaveBoxes
	for i in range(9):
		var octaveBox : Control = $"../OctaveBoxesContainer".get_child(i)
		octaveBox.get_child(0).dropped.connect(change_octave.bind(i))

func change_octave(oct : int, wr : int):
	# Use GPM to change type
	gpm.set_type(wr, "octave", oct)

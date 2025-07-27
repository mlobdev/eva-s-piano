extends Node

# Set the octaves value of the draggables (in phone display) based on the game data

func _ready() -> void:
	set_starter_octave()

func set_starter_octave():
	# Change the 9 octaves
	for i in range(9):
		var wr : Dictionary = Global.game_data["Wrappers"]["Wrapper" + str(i)]
		set_octave(i, wr["octave"])

func set_octave(num : int, oct : int):
	# Set specific octave
	var octave_label : RichTextLabel = get_node("../OctaveBoxesContainer/OctaveBoxContainer" + str(num) + "/Octave")
	octave_label.text = str(oct)

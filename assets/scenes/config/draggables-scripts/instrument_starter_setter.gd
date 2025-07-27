extends Node

# Sets the initial instrument textures

# Array of reference TextureRects for each instrument type.
var examples_rects : Array 

func _ready() -> void:
	# Initialize the reference textures for each instrument from their respective nodes.
	examples_rects = [
	$"../../../FooterMenu/HorizontalChangers/Draggable_containers/InstrumentDraggable/Drags0/InsContainer/PIANO",
	$"../../../FooterMenu/HorizontalChangers/Draggable_containers/InstrumentDraggable/Drags1/InsContainer/ORGAN",
	$"../../../FooterMenu/HorizontalChangers/Draggable_containers/InstrumentDraggable/Drags2/InsContainer/SQUARE",
	$"../../../FooterMenu/HorizontalChangers/Draggable_containers/InstrumentDraggable/Drags3/InsContainer/TRIANGLE",
	]
	# Set instruments in each box
	set_starter_instrument()

func set_starter_instrument():
	# Set the instruments according to the stored game data
	for i in range(9):
		var wr : Dictionary = Global.game_data["Wrappers"]["Wrapper" + str(i)]
		set_instrument(i, wr["instrument"])

func set_instrument(num : int, ins : int):
	# Set a specific instrument (it only changes the texture)
	var instrument_texture : TextureRect = get_node("../InstrumentsBoxesContainer/InstrumentBoxContainer" + str(num) + "/Instrument")
	instrument_texture.texture = examples_rects[ins].texture

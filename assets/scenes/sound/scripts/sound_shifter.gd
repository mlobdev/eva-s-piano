extends Node

class_name SoundShifter

enum Instrument {PIANO, ORGAN, SQUARE, TRIANGLE}

func get_pitch_scale(n: String, i : int) -> float:
	# Returns the pitch scale factor for a given note and instrument
	# Dynamically get the shifter node for the specified instrument
	var shifter = get_node("../Instruments/" + Instrument.keys()[i] + "/" + Instrument.keys()[i] + "Shifter")
	# Dynamically call the scale method for the instrument (e.g., get_PIANO_scale)
	var pitch_scale = Callable(shifter, "get_" + Instrument.keys()[i] + "_scale").bind(n).call()
	return pitch_scale

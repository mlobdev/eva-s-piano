extends Node

class_name StreamGiver

enum Instrument {PIANO, ORGAN, SQUARE, TRIANGLE}

func get_audiostream_to_play(n: String, o : int, i : int) -> AudioStream:
	# Dynamically call the method "get_INSTRUMENT_giver" on the giver node, passing note and octave
	var giver = get_node("../Instruments/" + Instrument.keys()[i] + "/" + Instrument.keys()[i] + "Giver")
	var stream = Callable(giver, "get_" + Instrument.keys()[i] + "_giver").bind(n, o).call()
	return stream

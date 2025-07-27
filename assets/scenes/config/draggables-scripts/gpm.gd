extends Node

class_name GPM
# GlobalPianoManager is the main node that interacts with game data

func set_type(wr: int, key: String, value : int):
	# Changes the key (type, octave or instrument) to a specific value
	Global.game_data["Wrappers"]["Wrapper" + str(wr)][key] = value

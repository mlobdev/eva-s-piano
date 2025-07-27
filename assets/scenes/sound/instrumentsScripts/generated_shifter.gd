extends Node

class_name GenShifter

# If the sound is generated we don't depend on specific samples because we can generate them all
# So I made for each generated instrument a function that returns one since when the scale
# is required it uses the following format get_INSTRUMENT_scale

func get_SQUARE_scale(_n: String) -> float:
	return 1

func get_TRIANGLE_scale(_n: String) -> float:
	return 1

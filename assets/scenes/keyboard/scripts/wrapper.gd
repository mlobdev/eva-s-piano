extends Control

class_name Wrapper

# It can contain CDE FGAB or none, check wrappers node to see the enum
var type : int
# Octave
var octave : int
# Instrument, check wrappers node to see the enum
var instrument : int

func set_type(wr_type):
	# Sets type in wrapper creator ("Wrappers" node)
	type = wr_type

func set_octave(o : int):
	# Sets octave in wrapper creator ("Wrappers" node)
	octave = o

func set_instrument(i : int):
	# Sets instrument in wrapper creator ("Wrappers" node)
	instrument = i

extends Node

# Observes instrument signal

var gpm : GPM

func _ready() -> void:
	# Referenecs Global Piano Manager
	gpm = get_node("../../GlobalPianoManager")
	# Connects signal dropped to change_instrument()
	for i in range(9):
		var instrumentBox : InsBox = $"../InstrumentsBoxesContainer".get_child(i)
		instrumentBox.dropped.connect(change_instrument.bind(i))

func change_instrument(ins : int, wr : int):
	# Tells GPM to change instrument value
	gpm.set_type(wr, "instrument", ins)

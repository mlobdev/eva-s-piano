extends Control

# Signal emitted when all containers (Wrappers) have been created
signal containers_created

enum PianoType {CDE, FGAB, NONE}
enum Instrument {PIANO, ORGAN, SQUARE, TRIANGLE}

func _ready() -> void:
	duplicate_containers()
	containers_created.emit()

func duplicate_containers():
	# Loop to create 9 Wrapper instances
	for i in range(9):
		var wr : Wrapper = Wrapper.new()
		wr.name = "Wrapper" + str(i)
		add_child(wr)
		# Initialize wrapper properties from global game data
		wr.set_type(Global.game_data["Wrappers"][wr.name]["type"])
		wr.set_octave(Global.game_data["Wrappers"][wr.name]["octave"])
		wr.set_instrument(Global.game_data["Wrappers"][wr.name]["instrument"])

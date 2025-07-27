extends Node

class_name SoundLoader

var instruments_to_load : Array # All instruments that must be loaded

var samples_loaded : Dictionary = {
	"aliases" : [],
	"references" : []
}

enum Instrument {PIANO, ORGAN, SQUARE, TRIANGLE}

# This class is only used by those instruments that use samples, if it's generated just don't use it
# If you add instruments to enum Instrument you can add as much samples instruments as you want
# just make sure the int matches the game_data and the others enums

func _ready() -> void:
	get_instruments_to_load()
	load_samples()

func get_instruments_to_load() -> void:
	for wrapper in Global.game_data["Wrappers"]:
		if instruments_to_load.count(Global.game_data["Wrappers"][wrapper]["instrument"]) == 0:
			instruments_to_load.append(Global.game_data["Wrappers"][wrapper]["instrument"])

func load_samples():
	for instrument in instruments_to_load:
		var loader = get_node("../Instruments/" + Instrument.keys()[instrument] + "/" + Instrument.keys()[instrument] + "Loader")
		var load_call = Callable(loader, "load_" + Instrument.keys()[instrument] + "_samples").bind(samples_loaded)
		load_call.call()
		

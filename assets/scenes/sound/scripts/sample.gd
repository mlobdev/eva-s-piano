extends Resource

class_name Sample

var alias: String # Alias to identify specific sample
var audio_stream: AudioStream  # Loaded WAV is stored here

func set_alias(a : String) -> void:
	# Changes alias
	alias = a

func set_audio_stream(path : String):
	# Sets AudioStream loading from a path
	audio_stream = ResourceLoader.load(path)

func set_direct_audio_stream(au : AudioStream) -> void:
	# Sets AudioStream already loaded
	audio_stream = au

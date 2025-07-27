extends Node

class_name PianoLoader

func load_PIANO_samples(samples_loaded : Dictionary) -> void:
	var samples_path : PackedStringArray = get_PIANO_samples_path()
	for concrete_sample in samples_path:
		var correct_path : String = concrete_sample.substr(0, concrete_sample.length()-7)
		var loaded : Sample = Sample.new()
		loaded.set_alias("piano_" + correct_path)
		loaded.set_audio_stream("res://assets/samples/piano/" + correct_path)
		samples_loaded["aliases"].append(loaded.alias)
		samples_loaded["references"].append(loaded)
		
func get_PIANO_samples_path() -> PackedStringArray:
	var samples : PackedStringArray = DirAccess.get_files_at("res://assets/samples/piano")
	samples = Array(samples).filter(func(file: String) -> bool: return file.ends_with(".import"))
	return samples

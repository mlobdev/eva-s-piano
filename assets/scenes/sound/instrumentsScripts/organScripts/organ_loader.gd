extends Node

class_name OrganLoader

# Loads all ORGAN sample files into the given dictionary.
# This function populates two arrays:
# - "aliases": list of string identifiers (e.g., "organ_C4")
# - "references": list of Sample objects containing the audio stream and alias

func load_ORGAN_samples(samples_loaded : Dictionary) -> void:
	var samples_path : PackedStringArray = get_ORGAN_samples_path()
	for concrete_sample in samples_path:
		# Remove the last 7 characters from the filename (i.e., ".wav.import") to get the base name
		var correct_path : String = concrete_sample.substr(0, concrete_sample.length()-7)
		
		# Create a new Sample object and assign alias and audio stream path
		var loaded : Sample = Sample.new()
		loaded.set_alias("organ_" + correct_path)
		loaded.set_audio_stream("res://assets/samples/organ/" + correct_path)
		# Append alias and reference to the samples_loaded dictionary
		samples_loaded["aliases"].append(loaded.alias)
		samples_loaded["references"].append(loaded)
	
# Retrieves the list of .import files from the organ samples directory.
# These files are used by Godot to track imported audio files.
func get_ORGAN_samples_path() -> PackedStringArray:
	var samples : PackedStringArray = DirAccess.get_files_at("res://assets/samples/organ")
	samples = Array(samples).filter(func(file: String) -> bool: return file.ends_with(".import"))
	return samples

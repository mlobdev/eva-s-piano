extends Node

class_name OrganGiver

# Responsible for retrieving the appropriate AudioStream for organ sounds

func get_ORGAN_giver(note : String, octave : int) -> AudioStream:
	# Get a simplified note used for sample lookup (either "C" or "F#")
	var sound = get_note(note)
	# Access the loaded audio samples from the SoundLoader node
	var samples : Dictionary = get_node("../../../SoundLoader").samples_loaded
	# Find the sample index in the alias list using the formatted filename
	var sample_index : int = samples["aliases"].find("organ_" + sound + str(octave) + ".wav")
	# Retrieve the corresponding Sample object using the found index
	var sample : Sample = samples["references"][sample_index]
	# Return the audio stream associated with the sample
	return sample.audio_stream
	
func get_note(n : String) -> String:
	# Simplify the note selection for organ samples:
	# - Return "C" if the note is within the first 4 semitones (C to E)
	# - Otherwise, return "F#"
	var notes : Array = ["C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B"]
	var idx = notes.find(n)
	var note_to_send : String = "C" if idx in range(4) else "F#"
	return note_to_send

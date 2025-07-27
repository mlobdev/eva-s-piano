extends Node

class_name SquareGiver

# Returns the audio stream for a given note and octave using the "square" waveform.

func get_SQUARE_giver(note: String, octave: int) -> AudioStreamWAV:
	var samples : Dictionary = get_node("../../../SoundLoader").samples_loaded
	var sample_index : int = samples["aliases"].find("square_" + note + str(octave))
	var sample : Sample = samples["references"][sample_index]
	return sample.audio_stream

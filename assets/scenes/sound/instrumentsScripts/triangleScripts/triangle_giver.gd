extends Node

class_name TriangleGiver
# Returns the audio stream for a given note and octave using the "triangle" waveform.

func get_TRIANGLE_giver(note: String, octave: int) -> AudioStreamWAV:
	var samples : Dictionary = get_node("../../../SoundLoader").samples_loaded
	var sample_index : int = samples["aliases"].find("triangle_" + note + str(octave))
	var sample : Sample = samples["references"][sample_index]
	return sample.audio_stream

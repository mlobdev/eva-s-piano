extends Node

class_name PianoGiver

var notes : Array = ["C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B"]

func get_PIANO_giver(note : String, octave : int) -> AudioStream:
	var sound = get_note(note)
	var samples : Dictionary = get_node("../../../SoundLoader").samples_loaded
	var sample_index : int = samples["aliases"].find("piano_" + sound + str(octave) + ".wav")
	var sample : Sample = samples["references"][sample_index]
	return sample.audio_stream

func get_note(note : String) -> String:
	var note_index = mult_x(notes.find(note),3)
	return notes[note_index]

func mult_x(e : int, x : int) -> int:
	# Multiple of x
	var div = int(round(float(e) / x))*x
	return div  if div != 12 else 11

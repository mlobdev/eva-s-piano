extends Node

class_name SoundMediator

signal emit_sound(note: String, octave : int, instrument : int)

signal stop_sound(note : String, octave : int)

func key_play(note : String, octave: int, instrument : int):
	# Tells the sound pool to reproduce a sound, it only listen to the key
	emit_sound.emit(note, octave, instrument)

func key_stop(note : String, octave: int, instrument : int):
	# Tells the sound pool to stop a sound, it only listen to the key
	stop_sound.emit(note, octave, instrument)

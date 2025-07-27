extends Node

class_name PianoShifter

var notes : Array = ["C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B"]

func get_PIANO_scale(note : String) -> float:
	var shifting_note = notes[mult_x(notes.find(note),3)]
	var diff = notes.find(note) - notes.find(shifting_note)
	return 1.05946**diff

func mult_x(e : int, x : int) -> int:
	# Multiple of x
	var div = int(round(float(e) / x))*x
	return div  if div != 12 else 11

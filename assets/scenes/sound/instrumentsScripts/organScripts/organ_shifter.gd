extends Node

class_name OrganShifter

# Returns a pitch scale factor for the given musical note.
# The scale is based on semitone distance from a reference note (e.g., C or F#),
# and is used to pitch-shift organ samples when exact notes are not recorded.

func get_ORGAN_scale(note : String) -> float:
	# Compute the semitone difference:
	# - If the note is in the first 4 notes (C to E), it is based on C
	# - Otherwise, it's based on F# (shifted 6 semitones down)
	var notes : Array = ["C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B"]
	var idx = notes.find(note)
	var diff : float = idx if idx in range(4) else idx-6
	return 1.05946 ** diff

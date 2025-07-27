extends Node

# Paths to bitmask textures for keyboard keys
const paths : Array = ["res://assets/images/keyboard/right_bitmask.png", "res://assets/images/keyboard/both_bitmask.png" ,"res://assets/images/keyboard/left_bitmask.png"]
var bitmaps : Array

# Uses flyweight pattern
# Each key access to a single
var notes_dict : Dictionary 

func _ready() -> void:
	# Load bitmask textures into bitmaps array
	load_bitmaps()
	notes_dict = {
		"C" : bitmaps[0], 
		"D" : bitmaps[1],
		"E" : bitmaps[2], 
		"F" : bitmaps[0],
		"G" : bitmaps[1], 
		"A" : bitmaps[1], 
		"B" : bitmaps[2],
		"C#" : null, 
		"D#" : null, 
		"F#" : null, 
		"G#" : null, 
		"A#" : null
	}

func load_bitmaps():
	# Load each texture path and append to the bitmaps array
	for path in paths:
		var bitmap = load(path)
		bitmaps.append(bitmap)

func get_bitmask(note) -> BitMap:
	# Return the bitmask texture associated with the note key
	# Returns null if no texture is assigned
	return notes_dict[note]

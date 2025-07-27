extends Node

# Array of musical notes including sharps
const notes : PackedStringArray = ["C", "D", "E", "F", "G", "A", "B", "C#", "D#", "F#", "G#", "A#"]
var bitmask_manager : Node

func _ready() -> void:
	# Reference to the BitmaskManager node responsible for providing bitmask textures
	bitmask_manager = get_node("BitmaskManager")

func create_keys(keys_number : int, wrapper : Wrapper, starting_note : String, offset : Vector2 = Vector2.ZERO, separation : Vector2 = Vector2.ZERO) -> void:
	# Dynamically creates piano keys and adds them as children to the wrapper container
	for i in range(keys_number):
		var key := PianoKey.new()
		wrapper.add_child(key)
		
		# Assign the note based on the starting note and index offset in the notes array
		key.set_note(notes[notes.find(starting_note)+i])
		var bitmask = bitmask_manager.get_bitmask(key.note)
		if bitmask != null:
			key.set_bitmask(bitmask)
		# Setup the visual texture and shader for the key
		key.set_texture()
		key.set_shaders()
		# Position the key with offset and separation to space keys properly
		key.position = offset + separation * i

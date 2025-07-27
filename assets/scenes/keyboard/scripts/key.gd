extends TouchScreenButton

class_name PianoKey
# Represents a single piano key button with sound and visual behavior

# Shared static texture to avoid reloading textures for each instance
static var texture : Texture2D
# Uniform scale applied to all piano keys
static var key_scale : Vector2 = Vector2(0.7,0.7)

# Note identifier (e.g., "C", "D#", etc.)
var note : String
# Reference to the sound mediator responsible for playing sounds
var sound_mediator : SoundMediator

func _ready() -> void:
	# Apply the uniform scale to key
	scale = key_scale
	# Access key to sound_mediator
	sound_mediator = get_node("/root/Control/Keyboard").get_child(0).get_child(0)
	
	# Connect input signals to handle key press and release
	pressed.connect(_on_pressed)
	released.connect(on_released)

func _on_pressed() -> void:
	if is_paused():
		# If the app is paused return
		return
	# Request the sound mediator to play this note with octave and instrument info
	sound_mediator.key_play(note, get_parent().octave, get_parent().instrument)

func on_released() -> void:
	if is_paused():
		# If the app is paused return
		return
	# Request the sound mediator to play this note with octave and instrument info
	sound_mediator.key_stop(note, get_parent().octave, get_parent().instrument)

func set_note(n : String):
	# Changes note
	note = n

func set_texture() -> void:
	# Set the texture depending on whether the note is white key (single char) or black key (sharp/flat)
	texture = load("res://assets/images/keyboard/white_key.png") if note.length() == 1 else load("res://assets/images/keyboard/black_key.png")
	texture_normal = texture

func set_shaders() -> void:
	# Set the appropriate shader depending on key type (white or black)
	material = load("res://assets/materials/keywhite.tres") if note.length() == 1 else load("res://assets/materials/keyblack.tres")

func is_paused() -> bool:
	# Utility method to check if the game is paused globally
	return Global.paused

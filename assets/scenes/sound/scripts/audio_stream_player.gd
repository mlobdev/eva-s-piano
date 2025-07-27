extends AudioStreamPlayer

class_name CustomPlayer

# Indicates whether the audio is currently in a stopping state
var stopping = false

# Sets the stopping state (used to control custom playback logic externally)
func set_stopping(st : bool):
	stopping = st

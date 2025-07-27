extends Control

# Erases any draggable that falls on it

func _can_drop_data(_position, _data):
	# Can always have data dropped
	return true

func _drop_data(_position, data):
	# Frees the data when it gets dropped
	data.free()

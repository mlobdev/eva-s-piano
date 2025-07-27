extends Control

class_name InsBox
# Container for the instrument draggable

signal dropped(new_instrument : int)

enum Instrument {PIANO, ORGAN, SQUARE, TRIANGLE}
# Enum representing available instruments.

func _can_drop_data(_position, _data):
	# Always allow drops on this container.
	return true

func _drop_data(_position, data):
	if data.get_child(0) is not TextureRect:
		# It only expects a specific TextureRect
		return
	get_child(0).texture = data.get_child(0).texture # Compares images
	dropped.emit(Instrument.keys().find(data.get_child(0).name)) # Emit signal

extends RichTextLabel

class_name OctaveBox
# Contains Octave draggables

signal dropped(new_octave : int)

func _can_drop_data(_position, _data):
	# Data can always be dropped
	return true

func _drop_data(_position, data):
	# When data is dropped
	if data.get_child(0) is not RichTextLabel:
		# If it's not a RichTextLabel returns. It must have text
		return
	# Changes the text
	text = data.get_child(0).text
	# Emmits dropped signal
	dropped.emit(int(text))

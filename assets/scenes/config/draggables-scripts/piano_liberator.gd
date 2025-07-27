extends Node

class_name PianoLiberator
# Frees specific type boxes, it's used in type_observer

func free_boxes(container : GridContainer, starting_number : int, ending_number : int):
	# Frees boxes that are one after another
	for i in range(starting_number, ending_number):
		if container.get_child(i).get_child(0).get_child_count() > 1:
			container.get_child(i).get_child(0).get_child(1).free()

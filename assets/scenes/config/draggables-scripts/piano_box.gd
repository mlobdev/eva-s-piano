extends Control

class_name TypeBox
# Contains Type draggables (CDE or FGAB)

signal dropped(wr_num : int, type : int)

func _can_drop_data(_position, _data):
	# Can only drop data if it doesn't have already a piano dropped
	return get_child_count() < 2

func _drop_data(_position, data):
	# When data is dropped
	# Removes data from its parent
	data.get_parent().remove_child(data)
	# Add data to itself
	add_child(data)
	# Sets some data visuals
	data.global_position = get_parent().global_position
	data.scale = Vector2.ONE*0.2874
	$"../../../../VanishEffect".change_alpha(get_child(0), 0, 0)
	# When emits the signal checks the type of the piano (CDE or FGAB)
	dropped.emit(int(str(get_parent().name)[-1]), 0 if data.name.contains("CDE") else 1)

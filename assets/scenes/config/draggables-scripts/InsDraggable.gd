extends Control

class_name InsDraggable
# Draggable of instruments

func _get_drag_data(_position):
	# Called when the drag is initiated
	# Create a duplicate to be used as the visual drag preview
	var preview : InsDraggable = duplicate()
	set_drag_preview(preview)
	return preview # It always returns the duplicated

func _can_drop_data(_position, _data):
	# This node does not accept any drops
	return false

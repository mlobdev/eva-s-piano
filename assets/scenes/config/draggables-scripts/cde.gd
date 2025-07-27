extends Control

class_name Draggable
# Draggable of notes CDE

func _get_drag_data(_position):
	# Called when the drag is initiated
	# Create a duplicate to be used as the visual drag preview
	var preview : Draggable = duplicate()
	change_visuals(preview)
	set_drag_preview(preview)

	if get_parent().name.contains("Drags"):
		# If this node is inside a container named Drags
		# duplicate the node and add the copy to the same parent
		var dropped : Draggable = duplicate()
		get_parent().add_child(dropped)
		dropped.name = "CDE" # Type of piano
		return dropped  # This is the actual drag data
	else:
		return self  # Use self as drag data if not under "Drags"

static func change_visuals(obj : Draggable):
	# Static helper to change the appearance of a node for preview purposes
	obj.modulate.a = 0.6  # Make it semi-transparent
	obj.pivot_offset = obj.size / 2  # Center the pivot for better dragging

func _can_drop_data(_position, _data):
	# This node does not accept any drops
	return false

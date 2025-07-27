extends MarginContainer

func _ready() -> void:
	# Override the left margin constant to -2 for layout adjustment
	add_theme_constant_override("margin_left", -2)
	# Connect signal to handle when a child node enters the scene tree
	child_entered_tree.connect(Callable(self, "_on_child_entered"))
	
func _on_child_entered(child : Node) -> void:
	# Adjust the right margin constant based on the type of the entering child
	# Uses PianoKey.key_scale.x as a scaling factor for margin size
	var marg_right = 774 * PianoKey.key_scale.x if child.type == 0 else 1034 * PianoKey.key_scale.x
	add_theme_constant_override("margin_right", marg_right)

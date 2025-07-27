extends Node

# Observe type draggable signals

var gpm : GPM

func _ready() -> void:
	# GlobalPianoManager reference
	gpm = get_node("../../GlobalPianoManager")
	# Connect signals
	for container in $"../TypeBoxesContainer".get_children():
		container.get_child(0).dropped.connect(reorganizate_rows)
		container.get_child(0).child_exiting_tree.connect(to_erase_type.bind(container))
	# Increase security of changing scenes
	tree_exiting.connect(back_button_called)

func to_erase_type(_node : Node, cnt : Control):
	# When a type box leaves the scene it must be set to 0 in game data
	var vanish_effect : VanishEffect = get_node("../../VanishEffect")
	# Vanishes the container (the square with the lines moving)
	vanish_effect.change_alpha(cnt.get_child(0).get_child(0), 1, 0)
	gpm.set_type(int(str(cnt.name)[-1]), "type", 2)

func reorganizate_rows(wr_num : int, type : int):
	var piano_liberator : PianoLiberator = get_node("../../PianoLiberator")
	if wr_num in range(3,6):
		# If the piano gets inside the second row it erases the other three rows
		piano_liberator.free_boxes($"../TypeBoxesContainer", 0,3)
		piano_liberator.free_boxes($"../TypeBoxesContainer", 6,9)
	else:
		# If not erases the second row
		piano_liberator.free_boxes($"../TypeBoxesContainer", 3,6)
	# Anyways sets the type in the game_data
	gpm.set_type(wr_num, "type", type)

func back_button_called():
	# Disconnect signals to increase security of changing scenes
	# I already experimented some crashes
	for container in $"../TypeBoxesContainer".get_children():
		container.get_child(0).child_exiting_tree.disconnect(to_erase_type)

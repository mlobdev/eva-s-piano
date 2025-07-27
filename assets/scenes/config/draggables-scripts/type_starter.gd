extends Node

# Sets the types to the stored in game data

func _ready() -> void:
	set_starter_piano()

func set_starter_piano():
	# For the type in each game data sets the draggables
	for i in range(9):
		var wr = Global.game_data["Wrappers"]["Wrapper" + str(i)]
		set_type(i, wr["type"])

func set_type(num : int, type : int):
	# Takes a CDE and FGAB example and sets them in their place
	var piano_box_container : Control = get_node("../TypeBoxesContainer")
	var cde : Draggable = get_node("../../../FooterMenu/HorizontalChangers/Draggable_containers/PianoDraggable/Drags0/CDE")
	var fgab : Draggable = get_node("../../../FooterMenu/HorizontalChangers/Draggable_containers/PianoDraggable/Drags1/FGAB")
	if type == 2:
		# 2 means void
		return
	# Gets the specific box
	var box : TypeBox = piano_box_container.get_child(num).get_child(0)
	# Duplicates the draggable depending on the type (CDE; FGAB)
	var started_dragged : Draggable = cde.duplicate() if type == 0 else fgab.duplicate()
	# Some visual effects
	$"../../VanishEffect".change_alpha(box.get_child(0), 0, 0)
	started_dragged.scale *= 0.6
	# Add the new draggable
	box.add_child(started_dragged)
	# Sets the position
	started_dragged.global_position = box.get_parent().global_position

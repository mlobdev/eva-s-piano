extends Node

# Listens to the signal and manages State switching

enum State { TYPE, OCTAVE, INSTRUMENT }

var current_index : int = 0
var enabled : bool = true

var draggable_containers : Control
var boxes : Control
var swapper_effect : SwapperEffect

func _ready():
	# Cache node references
	draggable_containers = get_node("../HorizontalChangers/Draggable_containers")
	boxes = get_node("../../Boxes")
	swapper_effect = get_node("../SwapperEffect")
	
	# Connect button signals
	var btn_left : TextureButton = get_node("../HorizontalChangers/LeftChangerContainer/LeftChanger")
	var btn_right : TextureButton = get_node("../HorizontalChangers/RightChangerContainer/RightChanger")
	btn_left.pressed.connect(_on_left_pressed)
	btn_right.pressed.connect(_on_right_pressed)

func _on_left_pressed():
	# Prevent changes during transition
	if !enabled:
		return
	# Store the old index to use it on update_state()
	var old_index : int = current_index
	# Rotate index to the left in range[0,2]
	current_index = (current_index + 2) % 3
	update_state(old_index)

func _on_right_pressed():
	# Prevent changes during transition
	if !enabled:
		return
	# Store the old index to use it on update_state()
	var old_index : int = current_index
	# Rotate index to the right in range[0,2]
	current_index = (current_index + 1) % 3
	update_state(old_index)

func update_state(old_index):
	# Trigger visual and functional transition between states
	
	# Prevent changes during transition
	enabled = false
	
	# Footer objects
	var leaving_obj : HBoxContainer = draggable_containers.get_child(old_index)
	var joining_obj : HBoxContainer = draggable_containers.get_child(current_index)
	
	# Phone image boxes
	var leaving_box : Control = boxes.get_child(old_index)
	var joining_box : Control = boxes.get_child(current_index)
	
	# Run swap animations
	swapper_effect.change_draggables_visibility(joining_box, leaving_box)
	await swapper_effect.change_draggables_visibility(joining_obj, leaving_obj)
	
	# Enables changes once the animations ended
	enabled = true

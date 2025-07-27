extends TextureButton

# Erases all the notes from the TYPE box (at phone icon)

func _ready() -> void:
	# Connects button signal
	pressed.connect(throw_all)

func throw_all():
	await change_to_type()
	erase_draggables()
	
func change_to_type():
	# Changes the state to Note
	var listener : Node = get_node("../../../FooterMenu/ChangerListener")
	var old_index : int = listener.current_index
	if old_index == 0:
		# if it's already on TYPE state return
		return
	listener.current_index = 0
	listener.update_state(old_index)
	
func erase_draggables():
	# Erases all draggables
	for box in $"../../../Boxes/TypeBoxes/TypeBoxesContainer".get_children():
		if box.get_child(0).get_child_count() < 2:
			# If it doesn't have a draggable then it passes to the next iteration
			continue
		var tween : Tween = create_tween()
		var drag := box.get_child(0).get_child(1)
		
		# Makes a small animation of the piano going to the trash can
		tween.tween_property(drag, "global_position", global_position+Vector2(90,70), 1)\
			.set_trans(Tween.TRANS_SINE)\
			.set_ease(Tween.EASE_IN_OUT)
			
		tween.parallel().tween_property(drag, "scale", Vector2.ONE * 0.01, 1)\
			.set_trans(Tween.TRANS_SINE)\
			.set_ease(Tween.EASE_IN_OUT)
			
		tween.tween_callback(drag.free)
		# Frees the draggable once the tween finishes
		# It works interanally because once a draggable is freed
		# the signal child_exited updates the data

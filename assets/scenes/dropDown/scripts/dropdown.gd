extends HBoxContainer

class_name DropdownContainer

func change_separation():
	# "theme_override_constants/separation" will interpolate from starting to final
	# This moves $ConfigContainer/GrayRect
	var starting_separation = get_theme_constant("separation")
	var final_separation : int = 2332 if starting_separation != 2332 else 1957
	
	var tween = create_tween()
	# Anonymous lambda to set separation
	tween.tween_method(
		func (trgt_sepr : int): add_theme_constant_override("separation", trgt_sepr), 
		starting_separation, 
		final_separation, 
		0.2
		)
	await tween.finished 
	tween = null

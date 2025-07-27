extends ColorRect

func _ready():
	change_visibility()

func change_visibility():
	# Change its visibility to its own alpha which can be 0 or 1
	visible = bool(self_modulate.a)

func change_alpha():
	# Toggle the alpha value between 0 and 1
	# If current alpha is not zero, target_alpha becomes 0 (fade out)
	# Otherwise, target_alpha becomes 1 (fade in)
	var target_alpha = 0 if self_modulate.a != 0 else 1
	
	if target_alpha == 1:
		show()
	
	var tween = create_tween()
	tween.tween_property(self, "self_modulate:a", target_alpha, 0.2)
	await tween.finished 
	if target_alpha == 0:
		hide()
	tween = null

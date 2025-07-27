extends Node

class_name SwapperEffect
# Manage effect of switching the State (used in ChangerListener)
# States are what you are deciding to change (TYPE, OCTAVE, INSTRUMENT)
# Change_draggables_visibility() is used in changer_listener

func change_alpha(obj : Object, value : float, time : float):
	# Transparency effect
	# obj is the object that will have changed its transparency
	# value is the value of the final transparency that obj will have
	# time is the time that will take the animation
	if time == 0:
		# Ff it's 0 it's instantaneous
		obj.self_modulate.a = value
		return
	# Tween the transparency
	var tween : Tween = create_tween()
	tween.tween_property(obj, "modulate:a", value, time)
	await tween.finished
	tween.kill()

func change_draggables_visibility(joining_obj : Object, leaving_obj : Object):
	# Changes the visibility
	joining_obj.show()
	change_alpha(joining_obj, 1, 1)
	await change_alpha(leaving_obj, 0, 1)
	leaving_obj.hide()

extends Node

class_name VanishEffect
# Has a vanish effect suitable for boxes

func change_alpha(obj : Object, value : float, time : float):
	# Replicates change_alpha of SwapperEffect
	if time == 0:
		obj.self_modulate.a = value
		return
	var tween = create_tween()
	tween.tween_property(obj, "self_modulate:a", value, time)
	await tween.finished
	tween.kill()

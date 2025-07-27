extends Node

# Dictionary to keep track of active tremolo tweens per AudioStreamPlayer
var tremolos : Dictionary

func apply_tremolo(player : AudioStreamPlayer):
	# Applies a tremolo effect to the given AudioStreamPlayer by modulating its volume periodically
	var depth : float = Global.game_data["Effects"]["Tremolo"]*10
	if depth == 0:
		# If depth is zero, the effect is skipped
		return
	var tween = create_tween()
	tremolos[player] = tween
	tween.set_loops()
	tween.tween_property(player, "volume_db", depth, 0.1).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(player, "volume_db", -depth, 0.1).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)

func stop_tremolo(player : AudioStreamPlayer):
	# Stops the tremolo effect on the given AudioStreamPlayer by killing its associated tween
	if tremolos.has(player):
		tremolos[player].kill()

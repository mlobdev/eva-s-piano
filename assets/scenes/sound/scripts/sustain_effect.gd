extends Node

func get_sustain() -> float:
	return Global.game_data["Effects"]["Sustain"]

func apply_sustain(player : AudioStreamPlayer):
	# Applies the sustain effect to the given AudioStreamPlayer by fading out its volume smoothly
	var sustain = get_sustain()
	if sustain == 1:
		# If sustain is 1 it uses the complete duration of the sample
		return
	# Tween volume from current level to -25 dB over a duration between 0.4 and 3 seconds depending on sustain
	var tween = create_tween()
	tween.tween_property(player, "volume_db", -25, lerp(0.4, 3.0, sustain))
	player.set_stopping(true)
	await tween.finished
	stop_notes(player)
	
func stop_notes(player : AudioStreamPlayer):
	# Stops the AudioStreamPlayer, resets its stream and volume, and clears the stopping flag
	player.stop()
	player.stream = null
	player.set_stopping(false)
	player.volume_db = 0

extends Node

class_name SoundStopper

func stop(player: AudioStreamPlayer):
	# Stops effects and player
	$"../Effects/TremoloEffect".stop_tremolo(player)
	$"../Effects/SustainEffect".apply_sustain(player)

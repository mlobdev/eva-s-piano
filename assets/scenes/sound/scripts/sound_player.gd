extends Node

class_name SoundPlayer

func play(player: AudioStreamPlayer, scale : float, audio_stream : AudioStream):
	# Plays the audio and apply effects
	player.pitch_scale = scale
	player.stream = audio_stream
	$"../Effects/TremoloEffect".apply_tremolo(player)
	player.play()

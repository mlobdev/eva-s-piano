extends Node

class_name SoundPool

func get_aviable() -> AudioStreamPlayer:
	# Returns an aviable AudioStreamPlayer
	for player in get_children():
		if player.playing == false and player.stopping == false:
			return player
	return $AudioStreamPlayer0

extends Node

# Audio system components
var sound_shifter : SoundShifter
var sound_pool : SoundPool
var sound_player : SoundPlayer
var sound_stopper : SoundStopper
var stream_giver : StreamGiver

# Enum for instrument types
enum Instrument {PIANO, ORGAN, SQUARE, TRIANGLE}

func _ready() -> void:
	# Get references to audio-related components
	sound_shifter = get_node("SoundShifter")
	sound_pool = get_node("SoundPool")
	sound_player = get_node("SoundPlayer")
	sound_stopper = get_node("SoundStopper")
	stream_giver = get_node("StreamGiver")
	
	var sound_mediator : Node = get_node("/root/Control/Keyboard").get_child(0).get_child(0)
	
	# Connect signals to handle play and stop requests
	sound_mediator.emit_sound.connect(play_key)
	sound_mediator.stop_sound.connect(stop_key)

func play_key(note : String, octave : int, instrument : int):
	# Called when a key is pressed
	# Get an available AudioStreamPlayer from the pool
	var player : AudioStreamPlayer = sound_pool.get_aviable()
	# Calculate pitch scale based on note and instrument
	var scale : float = sound_shifter.get_pitch_scale(note, instrument)
	# Get the correct AudioStream to play
	var audio_stream : AudioStream = stream_giver.get_audiostream_to_play(note, octave, instrument)
	
	# Delegate playback to the SoundPlayer
	sound_player.play(player, scale, audio_stream)

func stop_key(note : String, octave : int, instrument : int):
	# Called when a key is released
	# Get the corresponding audio stream for the note
	var audio_stream = stream_giver.get_audiostream_to_play(note, octave, instrument)
	# Look for a player currently using this stream
	for player in sound_pool.get_children():
		if player.stream == audio_stream and player.stopping == false:
			return sound_stopper.stop(player)

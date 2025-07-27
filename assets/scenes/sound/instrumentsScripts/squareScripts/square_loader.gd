extends Node

class_name SquareLoader

var notes := ["C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B"]

func load_SQUARE_samples(samples_loaded: Dictionary) -> void:
	for octave in range(3,6):
		for note in notes:
			var loaded := Sample.new()
			loaded.set_alias("square_" + note + str(octave))
			loaded.set_direct_audio_stream(create_square_wave(note, octave))
			samples_loaded["aliases"].append(loaded.alias)
			samples_loaded["references"].append(loaded)

# Returns a square wave AudioStreamWAV for the given note and octave
func create_square_wave(note: String, octave: int, duration: float = 0.5, volume: float = 0.2) -> AudioStreamWAV:
	# Convert note + octave to frequency in Hz using equal temperament
	var semitone_index = notes.find(note) + (octave - 4) * 12
	var freq := 440.0 * pow(2.0, (semitone_index - 9) / 12.0)

	# Configure sample rate and calculate number of samples
	var sample_rate := 44100
	var total_samples := int(sample_rate * duration)

	# Each stereo sample (left + right) is 4 bytes: 2 bytes per channel
	var num_bytes_per_sample_pair := 4
	var audio_byte_data := PackedByteArray()
	audio_byte_data.resize(total_samples * num_bytes_per_sample_pair)

	# Time stepping per sample
	var t := 0.0
	var increment := 1.0 / sample_rate
	var byte_offset := 0

	# Generate the square wave and write 16-bit stereo samples into byte array
	for i in total_samples:
		# Generate square wave: +volume or -volume depending on sign of sine
		var value := volume if sin(2.0 * PI * freq * t) >= 0.0 else -volume

		# Convert float [-1.0, 1.0] to 16-bit signed integer [-32768, 32767]
		var sample_val := int(clamp(value, -1.0, 1.0) * 32767.0)

		# Write left channel (little-endian)
		audio_byte_data[byte_offset + 0] = sample_val & 0xFF
		audio_byte_data[byte_offset + 1] = (sample_val >> 8) & 0xFF

		# Write right channel (duplicate for stereo)
		audio_byte_data[byte_offset + 2] = sample_val & 0xFF
		audio_byte_data[byte_offset + 3] = (sample_val >> 8) & 0xFF

		# Move to next sample pair
		byte_offset += num_bytes_per_sample_pair
		t += increment

	# Create the AudioStreamWAV object and assign data
	var audio_wav_stream := AudioStreamWAV.new()
	audio_wav_stream.format = AudioStreamWAV.FORMAT_16_BITS
	audio_wav_stream.stereo = true
	audio_wav_stream.mix_rate = sample_rate
	audio_wav_stream.loop_mode = AudioStreamWAV.LOOP_DISABLED
	audio_wav_stream.data = audio_byte_data

	# Return the audio stream ready to be played
	return audio_wav_stream

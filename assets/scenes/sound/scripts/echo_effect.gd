extends Node

func _ready() -> void:
	# Get the ConfigWheel node controlling the echo parameter
	var echoWheel : ConfigWheel = get_node("/root/Control/CanvasLayer/Dropdown/ConfigContainer/VBoxContainer/EchoButtonContainer2/EchoWheel")
	# Changes the echo amount when the button stops being pressed
	echoWheel.button_up.connect(set_echo_amount)
	set_echo_amount()

func set_echo_amount() -> void:
	# Wait one frame to ensure all nodes and inputs are fully ready
	await get_tree().process_frame
	
	# Get and clamp the effect value between 0.0 and 1.0
	var value : float = Global.game_data["Effects"]["Echo"]
	value = clamp(value, 0.0, 1.0)
	
	# Get the delay effect from the audio bus (bus index 0, effect index 2)
	var delay_effect := AudioServer.get_bus_effect(0, 2) as AudioEffectDelay
	AudioServer.set_bus_effect_enabled(0, 2, !value <= 0.001)
	
	# Apply delay settings based on value ranges:
	if value < 0.5:
		delay_effect.tap1_delay_ms = lerp(0.0, 250.0, value*2)
		delay_effect.tap2_delay_ms = 0.0
	else:
		delay_effect.tap1_delay_ms = 250.0
		delay_effect.tap2_delay_ms = lerp(0.0, 500.0, (value - 0.5) * 2.0)

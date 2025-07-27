extends Node

# Observes the button that is pressed to set a COLOR as focused of a ALREADY SELECTED palette

var focused_button : TextureButton

func _ready() -> void:
	connect_signals() # Connect button signals 
	set_first_focused($"../ColorsContainers/".get_child(0).get_child(0)) # Focus the first color

func connect_signals() -> void:
	# Connect all button signals
	for i in range(5):
		var button_color : TextureButton = $"../ColorsContainers".get_child(i).get_child(0)
		button_color.pressed.connect(set_focused.bind(button_color))

func set_first_focused(button_color : TextureButton):
	# Sets the first focused; it could be any color
	button_color.material.set_shader_parameter("focusing", true)
	focused_button = button_color

func set_focused(button_color : TextureButton) -> void:
	# Sets the current color focused
	focused_button.material.set_shader_parameter("focusing", false)
	button_color.material.set_shader_parameter("focusing", true)
	focused_button = button_color

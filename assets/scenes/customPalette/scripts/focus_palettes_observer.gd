extends Node

# Observes the button that is pressed to set a PALETTE as focused

var focused_palette : int
var focused_buttons : Array

func _ready() -> void:
	connect_signals() # Connects button signals
	set_first_focused(0) # Focus the first palette

func set_first_focused(index : int) -> void:
	# Sets the first focused palette; it could be any palette
	focused_palette = index
	focused_buttons[index].material.set_shader_parameter("focusing", true)
	$"../SpecificColorsManager".set_specific_colors()

func set_focused(index : int) -> void:
	# Sets the current palette focused
	focused_buttons[focused_palette].material.set_shader_parameter("focusing", false)
	focused_palette = index
	focused_buttons[index].material.set_shader_parameter("focusing", true)
	$"../SpecificColorsManager".set_specific_colors()

func connect_signals() -> void:
	# Connects all the buttons signals
	for i in range(2, 5):
		var palette_color : TextureButton = $"../ButtonsContainer".get_child(i).get_child(0)
		focused_buttons.append(palette_color)
		palette_color.pressed.connect(set_focused.bind(i-2))

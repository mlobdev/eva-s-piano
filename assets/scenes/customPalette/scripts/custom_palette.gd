extends Control

class_name CustomPalette
# Main manager of the custom palettes

var gcm : Node
var gcdm : Node
var fbo : Node
var fpo : Node
var scm : Node

func _ready() -> void:
	# References to various managers and observers in the scene
	gcm = get_node("GCM")
	gcdm = get_node("GCDM")
	fbo = get_node("FocusButtonsObserver")
	fpo = get_node("FocusPalettesObserver")
	scm = get_node("SpecificColorsManager")
	
	# Initialize shaders with the first palette
	gcdm.set_shaders_global_color(0)
	
	# Connect the color picker signal
	var color_picker : ColorPicker = get_node("ColorPicker")
	color_picker.color_changed.connect(updt_colors)

func updt_colors(color : Color):
	# Changes color in global data, shaders variables and that specific color of the specific palette
	gcm.change_global_color(color, fpo.focused_palette, fbo.focused_button.name)
	gcdm.change_shaders_global_color(fbo.focused_button.name, color)
	scm.change_specific_color(fbo.focused_button, color)

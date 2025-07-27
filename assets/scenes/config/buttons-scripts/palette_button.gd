extends TextureButton

# Generic class of palette button

@export var palette_name : String = "Hola"

# Each color is decided in the inspector and it sets the colours of the palettes
# when button is pressed

@export var main_color : Color = Color.WHITE
@export var accent_color : Color = Color.BLACK
@export var background_color : Color = Color.WHITE
@export var shadow_color : Color = Color.WHITE
@export var highlight_color : Color = Color.BLACK

func _ready() -> void:
	# Connect button signal
	pressed.connect(change_palette)
	
	# Sets its own color to main color and highlight color variables
	material.set_shader_parameter("main_color", main_color)
	material.set_shader_parameter("highlight_color", highlight_color)

func change_palette():
	# Sets the palette of the entire app
	Global.game_data["Palette"]["main_color"] = main_color
	Global.game_data["Palette"]["accent_color"] = accent_color
	Global.game_data["Palette"]["background_color"] = background_color
	Global.game_data["Palette"]["shadow_color"] = shadow_color
	Global.game_data["Palette"]["highlight_color"] = highlight_color
	Global.set_shader_parameters()

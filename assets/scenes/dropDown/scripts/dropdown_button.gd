extends TextureButton

var black_rect : ColorRect
var dropdown : DropdownContainer

func _ready() -> void:
	# References to the objects managed by this node
	black_rect = get_node("../../../BlackRectContainer/BlackRect")
	dropdown = get_node("../../..")
	self.pressed.connect(_on_drop_down_button_pressed)

func _on_drop_down_button_pressed() -> void:
	change_paused() # Pauses or reanudes app
	black_rect.change_alpha() # Darken the screen
	dropdown.change_separation() # Displays the dropdown menu
	Global.save_game() # Saves game to store wheel's changes

func change_paused():
	# Changes paused status
	Global.paused = !Global.paused

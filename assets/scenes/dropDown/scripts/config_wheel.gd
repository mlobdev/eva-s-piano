extends TextureButton

class_name ConfigWheel
# A UI wheel control to select and update a specific effect value in global game data

@export var effect_name : String = "Hola"
# Name for the tooltip

func _ready():
	# Load the stored effect value (normalized 0..1) and set wheel rotation accordingly
	var value : float = Global.game_data["Effects"][effect_name]
	rotation = value * PI
	# Connect button up signal
	button_up.connect(set_effect)

func _gui_input(event):
	# Handle user input
	var center : Vector2 = get_parent().global_position
	if event is InputEventScreenTouch or event is InputEventScreenDrag:
		var pos := get_viewport().get_mouse_position()
		rotation = get_wheel_rotation(pos, center)
		
static func get_wheel_rotation(mouse_pos : Vector2, wheel_center : Vector2) -> float:
	# Calculate the angle between the mouse position and the wheel center, adjusted by PI
	var angle : float = (mouse_pos - wheel_center).angle() + PI
	# Clamp or snap the angle to discrete steps to limit rotation range and snapping behavior
	if angle > PI:
		angle = PI if angle <= 3 * PI / 2 else 0.0
	var final_angle = snapp_angle(angle, 6)
	return final_angle

static func snapp_angle(a : float, steps) -> float:
	# Snapps the angle to make it feel more like a wheel
	return round(a * steps / PI)*PI/steps

func set_effect() -> void:
	# Save the current rotation normalized
	Global.game_data["Effects"][effect_name] = rotation / PI

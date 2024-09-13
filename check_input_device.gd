class_name CheckInputDevice
extends Node

static var isMouse = true

## Makes it so this input check is always running, even if the game is paused
func _ready():
	process_mode = Node.PROCESS_MODE_ALWAYS

func _input(event: InputEvent):
	## Checks for if the input device is mouse or gamepad
	if event is InputEventMouseMotion or event is InputEventMouseButton:
		isMouse = true
	elif event is InputEventJoypadButton or (event is InputEventJoypadMotion && deadzone_check()):
		isMouse = false

## If we do not have this, a controller that has stick drift
## Will constantly e telling the input check handler a controller is in use
func deadzone_check():
	var deadzone = 0.5
	var joystick_vector = Vector2(Input.get_joy_axis(0, 0), -Input.get_joy_axis(0, 1)).length()
	return deadzone < joystick_vector

static func get_input_type():
	return isMouse

extends Control

## Will be the button to show the functionality of both 
## mouse and Gamepad for this example
func _on_quit_button_pressed():
	get_tree().quit()

func _input(event: InputEvent):
	## Checks for if the Input Device is mouse or joypad
	if CheckInputDevice.get_input_type():
		## Run only if the mouse isn't visible
		if Input.mouse_mode != Input.MOUSE_MODE_VISIBLE:
			Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
			## We Must grab the focus first in order to release it
			## Godot 4.3 uses gui_release_focus() instead of these two lines
			$VBoxContainer/StartButton.grab_focus()
			$VBoxContainer/StartButton.release_focus()
			## Enabling Mouse Input and Hover w/individual calls
			$VBoxContainer/StartButton.mouse_filter = 0
			$VBoxContainer/SettingsButton.mouse_filter = 0
			$VBoxContainer/QuitButton.mouse_filter = 0
	## Run only if the mouse is visible
	elif Input.mouse_mode != Input.MOUSE_MODE_CAPTURED:
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
		$VBoxContainer/StartButton.grab_focus()
		## Disabling Mouse Input and Hover with a for loop call
		var currMenu = $VBoxContainer
		for currButton in currMenu.get_children():
			currButton.mouse_filter = 2
		
		## Let's say you had multiple vboxes or "menus" under one parent, then you'd do something like this
		#for currMenu in self.get_childre():
		#	for currButton in currMenu.get_children():
		#		currButton.mouse_filter = 2
		
		# Old Method where you list out each button individually
		#$VBoxContainer/StartButton.mouse_filter = 2
		#$VBoxContainer/SettingsButton.mouse_filter = 2
		#$VBoxContainer/QuitButton.mouse_filter = 2

class_name InputMapButton extends BaseCustomButton

signal action_remapped(action, event)

@export var action: String
@export var waiting_for_input_message := "Awaiting Input"

func _init():
	toggle_mode = true
	
func _ready():
	set_process_unhandled_input(false)
	update_key_text()
	
func _toggled(pressed_button):
	set_process_unhandled_input(pressed_button)
	if button_pressed :
		text = waiting_for_input_message
		release_focus()
	else : 
		update_key_text()
		grab_focus()
		
func _unhandled_input(event):
		InputMap.action_erase_events(action)
		InputMap.action_add_event(action, event)
		button_pressed = false
		action_remapped.emit(action, event)

func update_key_text():
	text = InputMap.action_get_events(action)[0].as_text()

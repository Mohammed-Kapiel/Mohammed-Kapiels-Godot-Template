extends HBoxContainer

#Todo: The resolution change currently only works in windowed mode. 

@onready var user_prefs: UserPrefrences = UserPrefrences.load_or_create()

@onready var window = get_window()

var resolution_options
@onready var resolution_option_button = $OptionButton

func _ready():
	resolution_options = user_prefs.get_resolution_options()

	for item in resolution_options:
		resolution_option_button.add_item(str(item[0]) + " x " + str(item[1]))
	
	resolution_option_button.select(user_prefs.resolution_option)
	set_resolution(user_prefs.resolution_option)

func _on_resolution_option_button_item_selected(index):
	set_resolution(index)

func set_resolution(index):
	if user_prefs:
		user_prefs.resolution_option = index
		user_prefs.save()
	
	var option = resolution_options[index]
	window.set_size(Vector2i(option[0], option[1]))


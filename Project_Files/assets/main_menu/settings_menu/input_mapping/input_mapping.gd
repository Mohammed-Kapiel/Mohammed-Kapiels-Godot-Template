extends Node

@onready var user_prefs: UserPrefrences = UserPrefrences.load_or_create()
@onready var input_map_container = $"."

@export var action_items : Array[String]
@export var focus_neighbor_top : Node
@export var focus_neighbor_bottom : Node

func _ready():
	create_action_remap_items()	

func create_action_remap_items():
	#var previous_item = focus_neighbor_top
	for i in range(action_items.size()):
		var action = action_items[i]
		var label = Label.new()
		label.text = action
		input_map_container.add_child(label)
		
		var button = InputMapButton.new()
		button.action = action
		#button.focus_neighbor_top = previous_item.get_path() 
		#previous_item.focus_neighbor_bottom = button.get_path()
		if i == action_items.size() - 1:
			#button.focus_neighbor_bottom = focus_neighbor_bottom
			pass
		#previous_item = button
		
		if user_prefs:
			if user_prefs.input_maps.has(action):
				var event = user_prefs.input_maps[action]
				InputMap.action_erase_events(action)
				InputMap.action_add_event(action, event)
		
		button.action_remapped.connect(_on_action_remapped)
		input_map_container.add_child(button)

func _on_action_remapped(action:String, event:InputEvent) -> void:
	if user_prefs:
		user_prefs.input_maps[action] = event
		user_prefs.save()

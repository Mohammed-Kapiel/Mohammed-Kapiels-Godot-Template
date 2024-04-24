extends Node

@export var target_level:String

func _on_swap_scene_requested():
		var loading_screen_instance = preload("res://assets/level_manager/loading_screen.tscn").instantiate()
		loading_screen_instance.target_level_path = target_level
		get_tree().get_root().get_child(1).add_child(loading_screen_instance)

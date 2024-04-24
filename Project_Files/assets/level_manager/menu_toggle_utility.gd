extends Node

@export var menu_scene : Node

func _on_toggle_menu_requested(on:bool ):
	if menu_scene:
		menu_scene.visible = on

func _on_open_menu_requested():
	if menu_scene:
		menu_scene.visible = true

func _on_close_menu_requested():
	if menu_scene:
		menu_scene.visible = false

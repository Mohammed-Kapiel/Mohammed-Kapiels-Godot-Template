extends Window

func _on_close_requested():
	visible = false


func _on_focus_exited():
	visible = false

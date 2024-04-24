extends Control

var loading_status : int
var progress : Array[float]

var target_level_path

@onready var progress_bar = $ProgressBar

func _ready() -> void:
	if(not target_level_path):
			push_warning("Path for new level isn't set, can't switch level")
			queue_free()
	# Request to load the target scene:
	ResourceLoader.load_threaded_request(target_level_path)
	
func _process(_delta: float) -> void:
	# Update the status:
	loading_status = ResourceLoader.load_threaded_get_status(target_level_path, progress)
	
	# Check the loading status:
	match loading_status:
		ResourceLoader.THREAD_LOAD_IN_PROGRESS:
			progress_bar.value = progress[0] * 100 # Change the ProgressBar value
		ResourceLoader.THREAD_LOAD_LOADED:
			# When done loading, change to the target scene:
			get_tree().change_scene_to_packed(ResourceLoader.load_threaded_get(target_level_path))
		ResourceLoader.THREAD_LOAD_FAILED:
			# Well some error happend:
			pass

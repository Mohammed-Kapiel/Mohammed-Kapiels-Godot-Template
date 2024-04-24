extends Control

@onready var user_prefs: UserPrefrences = UserPrefrences.load_or_create()

@onready var audio_stream_player = get_node("/root/AudioPlayer")
@onready var MUSIC_BUS_INDEX = AudioServer.get_bus_index("MUSIC")
@onready var SFX_BUS_INDEX = AudioServer.get_bus_index("SFX")
@onready var mute_threshold = 0.05

@onready var music_h_slider = %"Music HSlider"
@onready var sfx_h_slider = %"SFX HSlider"

func _ready():
	if music_h_slider:
		music_h_slider.value = user_prefs.music_volume
	if sfx_h_slider:
		sfx_h_slider.value = user_prefs.sfx_volume

func _on_music_h_slider_value_changed(value):
	AudioServer.set_bus_volume_db(MUSIC_BUS_INDEX, linear_to_db(value))
	AudioServer.set_bus_mute(MUSIC_BUS_INDEX, value < mute_threshold)
	
	if user_prefs:
		user_prefs.music_volume = value
		user_prefs.save()

func _on_sfx_h_slider_value_changed(value):
	AudioServer.set_bus_volume_db(SFX_BUS_INDEX, linear_to_db(value))
	AudioServer.set_bus_mute(SFX_BUS_INDEX, value < mute_threshold)
	
	if user_prefs:
		user_prefs.sfx_volume = value
		user_prefs.save()

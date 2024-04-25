class_name BaseCustomButton extends Button

#AudioPlayer is an autoload. The audio player can be found in res://assets/audio_player/
@onready var audio_player = AudioPlayer

func _on_pressed():
	audio_player.play_sfx()

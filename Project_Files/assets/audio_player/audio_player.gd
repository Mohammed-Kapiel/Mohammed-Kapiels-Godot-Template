extends Node

@onready var music_stream_player = %MusicStreamPlayer
@onready var sfx_stream_player = %SFXStreamPlayer

func play_sfx():
	sfx_stream_player.play()

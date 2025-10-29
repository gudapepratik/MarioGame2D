extends Node

@onready var audio_player = $AudioStreamPlayer2D
var current_track : AudioStream = null

func _ready():
	# Start background music when game starts
	play_music("res://Assets/Music/01. Ground Theme.mp3")

func play_music(stream_path: String):
	# Don’t reload same track
	if current_track and audio_player.stream and audio_player.stream.resource_path == stream_path:
		return

	var new_stream = load(stream_path)
	if new_stream:
		current_track = new_stream
		if current_track is AudioStreamOggVorbis or current_track is AudioStreamMP3 or current_track is AudioStreamWAV:
			current_track.loop = true
		audio_player.stream = current_track
		audio_player.play()
		audio_player.volume_db = 0
		audio_player.pitch_scale = 1
	else:
		print("❌ Could not load music:", stream_path)

func stop_music():
	if audio_player and audio_player.playing:
		audio_player.stop()

func play_main():
	play_music("res://Assets/Music/01. Ground Theme.mp3")

func play_underground():
	play_music("res://Assets/Music/02. Underground Theme.mp3")

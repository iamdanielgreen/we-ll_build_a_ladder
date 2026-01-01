# AUDIO PLAYER - INCORPORATES CODE FROM SOMA ANIMUS: https://www.youtube.com/watch?v=lILnUD3xph8

extends AudioStreamPlayer

const level_music = preload("res://assets/audio/music/WBAL_Music_WFTD.wav")

func _play_music(music: AudioStream, volume = -0.5):
	if stream == music:
		return
		
	stream = music
	volume_db = volume
	play()
	
	
func play_level_music():
	_play_music(level_music)

# NOTE: THIS CAUSES RIDICULOUS FEEDBACK
#func play_FX(stream: AudioStream, volume = 0.0):
	#var fx_player = AudioStreamPlayer.new()
	#fx_player.stream = stream
	#fx_player.name = "FX_PLAYER"
	#fx_player.volume_db = volume
	#add_child(fx_player)
	#fx_player.play()
	#
	#await fx_player.finished
	#
	#fx_player.queue_free()

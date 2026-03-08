#Uses code adapated from Codernunk "Make a Timer for Your Godot Game in 30 Seconds"...
#... (https://www.youtube.com/shorts/M-0UNa8M5bE)

extends CanvasLayer

@onready var out_of_time: CanvasLayer = $"../OutOfTime"
@onready var out_of_time_restart: Button = $"../OutOfTime/VBoxContainer/restart_button"

var time: float = 10.0  #time does not like being set above 59.999
#That was until you tried setting it to 300.0 on 07/09 and apparently it's fine now?
var minutes: int = 0
var seconds: int = 0
#var milliseconds: int = 0
var hundredths: int = 0

func _process(delta) -> void:
	time -= delta
	
	minutes = fmod(time, 3600) / 60
	seconds = fmod(time, 60)
	hundredths = fmod(time, 1) * 100
	
	$TimerDisplay/Minutes.text = "%02d" % minutes
	$TimerDisplay/Seconds.text = "%02d" % seconds
	$TimerDisplay/Hundredths.text = "%02d" % hundredths
	
	#NOTE 22/06/2025: THIS IS ONLY USEFUL IF YOU WANT A TIMER BUT SOMETIMES WANT TO TURN IT OFF.
		
	if GameManager.current_game_mode == GameManager.game_mode.TimerOff:
		queue_free()
		
	if time <= 0:
		stop_timer()
		queue_free()
		out_of_time.show()
		out_of_time_restart.grab_focus()
		get_tree().paused = true #TODO: DOES THIS HELP?
		
		#NOTE: LEFTOVER FROM JUMPFIGHTERS.
		#camera.apply_shake() #This isn't seen when get_tree().paused happens and I don't know why.
		
		#await get_tree().create_timer(1).timeout #Using Timer here means Out of Time Screen doesn't show.
		
		#NOTE: LEFTOVER FROM JUMPFIGHTERS, BUT YOU MIGHT WANT IT?
		#outta_time.show()
		#refight_outtatime.grab_focus()
		#get_tree().paused = true # Using this means camera shake doesn't happen. It also means people can keep playing.
		##... You know what, for now I'm just leaving it in. 
	
	
func stop_timer() -> void:
	set_process(false)
	
#func get_time_formatted() -> String:
	#return "%02d: %02d: %03d" % [minutes, seconds, milliseconds] # NOTE What does this even do?

extends Node

signal clockTick
@onready var clock_timer = %"Clock Timer"

var time_wait_time_changed: bool = true
var new_timer_wait_time: float = 1

var current_year:int = 0

var start_time

func _ready():
	start_time = Time.get_ticks_msec()
	clock_timer.wait_time = new_timer_wait_time
	clock_timer.start()

func _on_clock_timer_timeout():
	#A clock tick has passed
	current_year += 1
	clockTick.emit(current_year)

func get_play_time() -> int:
	return (Time.get_ticks_msec() - start_time)/1000

func change_year_delay(duration):
	if !clock_timer:
		return
	#var time_left = clock_timer.time_left
	#if time_left < duration:
		#_on_clock_timer_timeout()
	#
	clock_timer.stop()
	clock_timer.set_wait_time(duration)
	clock_timer.start()

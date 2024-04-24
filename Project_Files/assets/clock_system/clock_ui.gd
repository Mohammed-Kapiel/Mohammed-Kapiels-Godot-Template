extends Control

@onready var clock_manager = get_node("/root/ClockManager")
@onready var current_year_label = %"Current Year Label"
#@onready var play_time_label = %"Play Time Label"
@onready var year_delay_slider = %"Year Delay Slider"

func _ready():
	current_year_label.text = str(clock_manager.current_year)
	clock_manager.clockTick.connect(on_clock_tick)
	year_delay_slider.value = clock_manager.new_timer_wait_time

func on_clock_tick(current_year:int):
	current_year_label.text = str(current_year)

#func _process(_delta):
	#play_time_label.text = str(clock_manager.get_play_time())
	

func _on_year_delay_slider_value_changed(value):
	clock_manager.change_year_delay(1/value)

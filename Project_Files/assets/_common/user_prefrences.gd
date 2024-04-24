class_name UserPrefrences extends Resource

static var path: String = "user://user_prefs.tres"

@export var lang_code = "en"

var lang_codes: Dictionary = {
	"en" : "English",
	"ar" : "عربي"
}

#@export var window_option
#var window_options

@export var resolution_option:int = 0
var resolution_options: Array = [[1920, 1080], [1366, 768], [1280, 1024], [1024, 768]]

@export_range(0, 1, 0.05) var music_volume: float = 1.0
@export_range(0, 1, 0.05) var sfx_volume: float = 1.0

@export var input_maps: Dictionary = {}

func save():
	ResourceSaver.save(self, path)

static func load_or_create() -> UserPrefrences:
	var res = load(path) as UserPrefrences
	if !res:
		res = UserPrefrences.new()
	return res

func get_lang_codes() -> Dictionary:
	return lang_codes

func get_resolution_options() -> Array:
	return resolution_options

func get_input_maps() -> Dictionary:
	return input_maps

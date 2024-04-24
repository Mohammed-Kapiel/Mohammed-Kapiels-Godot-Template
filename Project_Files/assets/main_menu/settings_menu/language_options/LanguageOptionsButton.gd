extends OptionButton

@onready var user_prefs: UserPrefrences = UserPrefrences.load_or_create()

@onready var option_button = $"."
var lang_codes

func _ready():
	lang_codes = user_prefs.get_lang_codes()
	
	for item in lang_codes:
		option_button.add_item(item)
	
	if option_button:
		option_button.select(UtilGeneral.find_index_by_key(lang_codes, user_prefs.lang_code))
		set_global_language(user_prefs.lang_code)
	else:
		option_button.select(UtilGeneral.find_index_by_key(lang_codes, TranslationServer.get_locale()))

func _on_item_selected(index):
	var lang = lang_codes.keys()[index]
	set_global_language(lang)

func set_global_language(lang):
	if user_prefs:
		user_prefs.lang_code = lang
		user_prefs.save()
	TranslationServer.set_locale(lang)

extends MapAction
class_name CustomDialogueAction

export (String, FILE, "*.json") var dialogue_file_path : String
signal dialogue_loaded(data)
onready var MusicPlayer = get_node("/root/MusicPlayer")
onready var music_player = $MusicPlayer

func interact() -> void:
	var dialogue : Dictionary =  load_dialogue(dialogue_file_path)
	yield(local_map.play_dialogue(dialogue), "completed")
	var name = get_parent().get_parent().name
	print("%s" % name)
	if name == "Dialogue01":
		if GlobalVars.GlobalVars.Sparkle04 == true:
			MusicPlayer.play_fixedbgm()
			GlobalVars.GlobalVars.Dialogue01 = true
	if name == "Dialogue02":
		if GlobalVars.GlobalVars.Sparkle07 == true:
			local_map.plant_seed()
		GlobalVars.GlobalVars.Dialogue02 = true
	if name == "Dialogue03":
		if GlobalVars.GlobalVars.Sparkle01 == true:
			local_map.give_feather()
		GlobalVars.GlobalVars.Dialogue03 = true
	emit_signal("finished")

func load_dialogue(file_path) -> Dictionary:
	"""
	Parses a JSON file and returns it as a dictionary
	"""
	var file = File.new()
	print(file_path)
	assert(file.file_exists(file_path))

	file.open(file_path, file.READ)
	print(file)
	var dialogue = parse_json(file.get_as_text())
	print(dialogue)
	assert(dialogue.size() > 0)
	return dialogue

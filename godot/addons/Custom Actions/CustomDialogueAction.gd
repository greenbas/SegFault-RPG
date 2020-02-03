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
	if name == "Dialogue01": # Intro
		if GlobalVars.GlobalVars.Sparkle04 == true:
			GlobalVars.GlobalVars.Dialogue01 = true
			MusicPlayer.play_fixedbgm()
	if name == "Dialogue02":
		if GlobalVars.GlobalVars.Sparkle07 == true:
			GlobalVars.GlobalVars.Dialogue02 = true
			local_map.plant_seed()
	if name == "Dialogue03":
		if GlobalVars.GlobalVars.Sparkle01 == true:
			GlobalVars.GlobalVars.Dialogue03 = true
			local_map.give_feather()
	if name == "Dialogue04": # Heliotrope / Sundog
		# Don't let this trigger before the light's on
		if GlobalVars.GlobalVars.Sparkle03 and GlobalVars.GlobalVars.Dialogue04 == false:
			GlobalVars.GlobalVars.Dialogue04 = true
			local_map.quests_received() # First time only
		
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

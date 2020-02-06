extends MapAction
class_name CustomDialogueAction

export (String, FILE, "*.json") var dialogue_file_path : String
signal dialogue_loaded(data)
onready var MusicPlayer = get_node("/root/MusicPlayer")
#onready var music_player = $MusicPlayer

func interact() -> void:
	var name = get_parent().get_parent().name
	var dialogue : Dictionary =  load_dialogue(dialogue_file_path)
	yield(local_map.play_dialogue(dialogue), "completed")
	print("%s" % name)
	if name == "DialoguePawn": # Intro
		local_map.done_intro()
	if name == "Dialogue01": # Voice
		if GlobalVars.GlobalVars.Sparkle04 == true:
			GlobalVars.GlobalVars.Dialogue01 = true
			local_map.give_voice()
			MusicPlayer.play_fixedbgm()
		else:
			local_map.show_voice()
	if name == "Dialogue02":
		if GlobalVars.GlobalVars.Sparkle07 == true:
			GlobalVars.GlobalVars.Dialogue02 = true
			local_map.plant_seed()
		else:
			local_map.show_seed()
	if name == "Dialogue03":
		if GlobalVars.GlobalVars.Sparkle01 == true:
			GlobalVars.GlobalVars.Dialogue03 = true
			local_map.give_feather()
		else:
			local_map.show_feather()
	if name == "Dialogue04": # Heliotiet / Sundog
		# Don't let this trigger before the light's on
		if GlobalVars.GlobalVars.Sparkle03 and GlobalVars.GlobalVars.Dialogue04 == false:
			GlobalVars.GlobalVars.Dialogue04 = true
			local_map.quests_received() # First time only
	if name == "Dialogue05": # Ruins
		if GlobalVars.GlobalVars.Seed and GlobalVars.GlobalVars.Voice and GlobalVars.GlobalVars.Feather:
			local_map.open_menu()
	if GlobalVars.GlobalVars.Seed and GlobalVars.GlobalVars.Voice and GlobalVars.GlobalVars.Feather:
		local_map.fix_runes()
		local_map.open_door("DoorFinal")
	if name == "GameBoard":
		if GlobalVars.GlobalVars.Seed and GlobalVars.GlobalVars.Voice and GlobalVars.GlobalVars.Feather:
			local_map.win_screen()
	emit_signal("finished")

func load_dialogue(file_path) -> Dictionary:
	"""
	Parses a JSON file and returns it as a dictionary
	"""
	var file = File.new()
	print("Path: %s" % file_path)
	assert(file.file_exists(file_path))

	file.open(file_path, file.READ)
	print(file)
	var dialogue = parse_json(file.get_as_text())
	print(dialogue)
	assert(dialogue.size() > 0)
	return dialogue

extends AudioStreamPlayer

# MC Dialog Sounds
const MCspeech = preload("res://assets/audio/sound/dialog/mc_speech.ogg")
const MCques = preload("res://assets/audio/sound/dialog/mc_ques.ogg")
const MCsad = preload("res://assets/audio/sound/dialog/mc_sad.ogg")
const MCexclaim = preload("res://assets/audio/sound/dialog/mc_exclaim.ogg")

func diaMCspeech():
	stream = MCspeech
	play()

func diaMCques():
	stream = MCques
	play()

func diaMCsad():
	stream = MCsad
	play()

func diaMCexclaim():
	stream = MCexclaim
	play()


# NPC Character Dialog

#Character
#const charactername = preload("res://assets/audio/sound/dialog/file.ogg")

#func charactersound():
#	stream = charactername
#	play()

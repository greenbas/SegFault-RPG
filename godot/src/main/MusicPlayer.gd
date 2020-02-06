extends AudioStreamPlayer

const battle_theme = preload("res://assets/audio/bgm/battle_theme.ogg")
const victory_fanfare = preload("res://assets/audio/bgm/victory_fanfare.ogg")

const glitchbgm = preload("res://assets/audio/bgm/fieldglitch.ogg")
const fixedbgm = preload("res://assets/audio/bgm/fieldfixedbgm.ogg")

func play_glitchbgm():
	stream = glitchbgm
	play()

func play_fixedbgm():
	stop()
	stream = fixedbgm
	play()

func play_battle_theme():
	stream = battle_theme
	play()

func play_victory_fanfare():
	stream = victory_fanfare
	play()

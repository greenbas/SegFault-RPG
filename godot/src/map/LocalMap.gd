"""
Initializes the map's pawns and emits signals so the
Game node can start encounters
Processes in pause mode
"""
extends Node
class_name LocalMap

signal enemies_encountered(formation)
signal dialogue_finished()

onready var dialogue_box = $MapInterface/DialogueBox
onready var grid = $GameBoard

func _ready() -> void:
	assert(dialogue_box)
	for action in get_tree().get_nodes_in_group("map_action"):
		(action as MapAction).initialize(self)

func spawn_party(party) -> void:
	grid.pawns.spawn_party(grid, party)

func start_encounter(formation) -> void:
	emit_signal("enemies_encountered", formation.instance())

func play_dialogue(data):
	dialogue_box.start(data)
	yield(dialogue_box, "dialogue_ended")

func update_tile(n):
	grid.update_tile(n)
	
func init_dark():
	print("Initiate the darkness")
	$GameBoard/Pawns/Sparkle01.visible = false
	$GameBoard/Pawns/Sparkle02.visible = false
	$GameBoard/Pawns/Sparkle04.visible = false
	$GameBoard/Pawns/Sparkle05.visible = false
	$GameBoard/Pawns/Sparkle06.visible = false
	$GameBoard/Pawns/Sparkle07.visible = false
	$GameBoard/Pawns/Dialogue01.visible = false
	$GameBoard/Pawns/Dialogue02.visible = false
	$GameBoard/Pawns/Dialogue03.visible = false
	$GameBoard/Pawns/Dialogue04.visible = false # This is broken, replaced by the action of Empty_Floor_Coverup sprite
	$GameBoard/Pawns/DialoguePawn.visible = false
	$GameBoard/Pawns/Door01.visible = false
	$GameBoard/Pawns/Door02.visible = false
	$GameBoard/Pawns/Door03.visible = false
	$GameBoard/Pawns/DoorFinal.visible = false

func done_intro():
	$GameBoard/Pawns/DialoguePawn.visible = false

func enable_the_light():
	print("Enable the light")
	$Map.visible = true
	$DarkMap.visible = false
	$GameBoard/KoLeidoSprite.visible = true
	$GameBoard/SunSprite.visible = true
	$GameBoard/SundogSprite.visible = true
	$GameBoard/RuinsSprite.visible = true
	#$GameBoard/Pawns/Dialogue04.visible = true
	$GameBoard/Empty_Floor_Coverup.visible = false
	$GameBoard.open_door("Door01")
	$GameBoard.open_door("Door02")
	$GameBoard.open_door("Door03")
	$GameBoard.open_door("DoorFinal")

func quests_received():
	print("Quests received")
	
	$GameBoard/Pawns/Dialogue01.visible = true
	$GameBoard/Pawns/Dialogue02.visible = true
	$GameBoard/Pawns/Dialogue03.visible = true
	#$GameBoard.hide_pawn("Sparkle01")
	$GameBoard/Pawns/Sparkle01.visible = true
	$GameBoard/Pawns/Sparkle02.visible = true
	$GameBoard/Pawns/Sparkle04.visible = true
	$GameBoard/Pawns/Sparkle05.visible = true
	$GameBoard/Pawns/Sparkle06.visible = true
	$GameBoard/Pawns/Sparkle07.visible = true

func plant_seed():
	print("Plant seed")
	$GameBoard/ForestGoodSprite.visible = true
	$GameBoard/ForestGlitchSprite.visible = false
	
func give_feather():
	print("Give feather")
	$GameBoard/PreeteeGoodSprite.visible = true
	$GameBoard/PreeteeGlitchSprite.visible = false
	
func open_door(name):
	grid.open_door(name)

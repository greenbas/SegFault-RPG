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
	$GameBoard/Pawns/Sparkle01.visible = false
	$GameBoard/Pawns/Sparkle02.visible = false
	$GameBoard/Pawns/Sparkle04.visible = false
	$GameBoard/Pawns/Sparkle05.visible = false
	$GameBoard/Pawns/Sparkle06.visible = false
	$GameBoard/Pawns/Sparkle07.visible = false

func enable_the_light():
	$Map.visible = true
	$DarkMap.visible = false
	$GameBoard/Pawns/Sparkle01.visible = true
	$GameBoard/Pawns/Sparkle02.visible = true
	$GameBoard/Pawns/Sparkle04.visible = true
	$GameBoard/Pawns/Sparkle05.visible = true
	$GameBoard/Pawns/Sparkle06.visible = true
	$GameBoard/Pawns/Sparkle07.visible = true
	$GameBoard/KoLeidoSprite.visible = true
	$GameBoard/SunSprite.visible = true
	$GameBoard/SundogSprite.visible = true
	$GameBoard/RuinsSprite.visible = true
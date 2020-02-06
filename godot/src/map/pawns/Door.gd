"""
Pawn the player can interact with. Could be an NPC, a chest,
anything that should react when the player walks next to it
or presses a key while sitting next to this pawn.
Can work either with raycasts for interactions based on
look direction or using an Area2D
"""
extends Area2D
class_name Door

onready var grid = get_node("/root/GameBoard")
enum CELL_TYPES { ACTOR, OBSTACLE, OBJECT, SPARKLE, DOOR, DIALOGUE, DOOR90, DOOR180, DOOR270 }
export(CELL_TYPES) var type = CELL_TYPES.DOOR

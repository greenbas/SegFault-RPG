extends Node2D

class_name Pawn

enum CELL_TYPES { ACTOR, OBSTACLE, OBJECT, SPARKLE, DOOR, DIALOGUE, DOOR90, DOOR180, DOOR270 }
export(CELL_TYPES) var type = CELL_TYPES.ACTOR

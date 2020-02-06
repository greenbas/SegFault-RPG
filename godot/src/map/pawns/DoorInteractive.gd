"""
Pawn the player can interact with. Could be an NPC, a chest,
anything that should react when the player walks next to it
or presses a key while sitting next to this pawn.
Can work either with raycasts for interactions based on
look direction or using an Area2D
"""
extends PawnInteractive
class_name DoorInteractive

#func _ready():	
#	get_parent().set_cellv(position, get_parent().CELL_TYPES.DOOR)

func open_me():
	print("Opening door")
	get_parent().get_parent().set_cellv(position, -1)#get_parent().CELL_TYPES.OBJECT)
	#queue_free()
	#type = -1 #$GameBoard.OBJECT
	#$CollisionShape2D.disabled = true
	#$CollisionShape2D.queue_free()
	#$Pivot/PawnAnim.queue_free()
	#position = Vector2(3000,0)
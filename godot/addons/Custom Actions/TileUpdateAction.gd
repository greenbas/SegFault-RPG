extends MapAction
class_name TileUpdateAction

export var formation : PackedScene

func interact() -> void:
	get_tree().paused = false
	#local_map.start_encounter(formation)
	print("You interacted with me!")
	local_map.update_tile(0,0,0)
	emit_signal("finished")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


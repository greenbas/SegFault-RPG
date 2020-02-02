extends MapAction
class_name TileUpdateAction

export var formation : PackedScene

func interact() -> void:
	get_tree().paused = false
	#$Pawns/Sparkle01.visible = false
	local_map.update_tile(1)
	emit_signal("finished")

extends MapAction
class_name TileUpdateAction

export var formation : PackedScene

func interact() -> void:
	get_tree().paused = false
	local_map.update_tile(get_parent().get_parent().name)
	emit_signal("finished")

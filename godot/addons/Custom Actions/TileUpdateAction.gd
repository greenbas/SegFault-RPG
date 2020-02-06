extends MapAction
class_name TileUpdateAction

export var formation : PackedScene

func interact() -> void:
	get_tree().paused = false
	var name = get_parent().get_parent().name
	local_map.update_tile(name)
	if name == "Sparkle03":
		local_map.enable_the_light()
		#$Map.visible = true
		#$DarkMap.visible = false
	if name == "Sparkle02":
		local_map.open_door("Door01")
	if name == "Sparkle05":
		local_map.open_door("Door02")
	if name == "Sparkle06":
		local_map.open_door("Door03")
	emit_signal("finished")

extends Area2D

#onready var local_map = get_parent().$LocalMap
#onready var local_map = $LocalMap

func _input_event(viewport, event, shape_idx):
    if event is InputEventMouseButton \
    and event.button_index == BUTTON_LEFT \
    and event.is_pressed():
        self.on_click()

func on_click():
	print("Quitting game!")
	$WinDialogue.interact()
	#$WinScreen.visible = true
	#$QuitMenu_QuitText.visible = false
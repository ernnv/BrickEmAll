extends Node2D

# Declare member variables here. 


# Called when the node enters the scene tree for the first time.
func _ready():
	set_process_input(true)

func _input(event):
	if event is InputEventKey and event.is_action_pressed("ui_accept"):
		get_tree().quit()

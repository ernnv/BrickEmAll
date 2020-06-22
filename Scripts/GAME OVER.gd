extends Node2D

# Declare member variables here.
const MAXPOINTS = 100
const SCENE = preload("res://Scenes/LevelOne.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process_input(true)
	var level = SCENE.instance()
	var points = level.get_node("World").points_earned
	get_node("Title_Points").set_text("POINTS EARNED: " + str(points) + " / " + str(MAXPOINTS))

func _input(event):
	if event is InputEventKey and Input.is_action_pressed("ui_accept"):
		print("Quitting Game")
		get_tree().quit()

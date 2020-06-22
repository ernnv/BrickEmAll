extends Node2D

# Declare member variables here.
var score = 0 setget set_score
var lives = 3 setget set_lives
var points_earned = 10 setget set_points_earned

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func set_score(value):
	score = value
	get_node("Score").set_text("Score: " + str(score))

func set_lives(value):
	lives = value
	get_node("Lives").set_text("Lives: " + str(lives))

func set_points_earned(value):
	points_earned = value

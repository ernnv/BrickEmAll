extends KinematicBody2D

# Declare member variables here.
const BALL_PREFAB = preload("res://Prefabs/Ball.tscn")
const BALL_START = Vector2(0,16) 

var ball : Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	set_physics_process(true)
	set_process_input(true)

func _physics_process(delta):
	var y_position = position.y
	var mouse_x_position = get_viewport().get_mouse_position().x
	position = Vector2(mouse_x_position,y_position)

func _input(event):
	if event is InputEventMouseButton and event.is_pressed() and  not is_instance_valid(ball):
		ball = BALL_PREFAB.instance()
		ball.position = get_position() - BALL_START
		get_tree().get_root().add_child(ball)

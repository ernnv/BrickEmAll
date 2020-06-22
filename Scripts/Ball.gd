extends RigidBody2D

# Declare member variables here.
export var speedup = 20
export var maxspeed = 600

# Called when the node enters the scene tree for the first time.
func _ready():
	set_physics_process(true)

func _physics_process(delta):
	var bodies = get_colliding_bodies()
	
	#Collision with other objects
	for body in bodies:
		if body.is_in_group("Bricks"):
			body.queue_free()
			get_node("/root/World").score += get_node("/root/World").points_earned
			if get_node("/root/World/BricksNode").get_child_count() == 1:
				queue_free()
				get_tree().change_scene("res://Scenes/WonScreen.tscn")
	
		if body.get_name() ==  "Paddle":
			var speed = get_linear_velocity().length()
			var direction = position - body.get_node("Ancor").get_global_position()
			var velocity = direction.normalized() * min(speed + speedup, maxspeed)
			linear_velocity = velocity

	#Destroys ball. Please look for a cleaner way to code this. MATCH STATEMENTS
	if position.y > get_viewport_rect().end.y:
		queue_free()
		get_node("/root/World").lives -= 1
		if get_node("/root/World").lives == 0:
			get_tree().change_scene("res://Scenes/GAME OVER.tscn")
		if get_node("/root/World").lives == 1:
			get_node("/root/World").points_earned = 5
		if get_node("/root/World").lives == 2:
			get_node("/root/World").points_earned = 7

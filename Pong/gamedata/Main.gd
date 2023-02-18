extends Node2D

var ball_scene = load("res://ball.tscn")
var ball = ball_scene.instance()


# Called when the node enters the scene tree for the first time.
func _ready():
	$start_timer.start()
	
func _on_Timer_timeout():
	add_child(ball)


func _on_goal_timer_timeout():
	ball = ball_scene.instance()
	add_child(ball)


func _on_goal_1_body_exited(body):
	body.queue_free()
	print("point")
	$goal_timer.start()



func _on_goal_2_body_exited(body):
	body.queue_free()
	print("point")
	$goal_timer.start()

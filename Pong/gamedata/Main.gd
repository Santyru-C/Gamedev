extends Node2D

var ball_scene = load("res://ball.tscn")
var ball = ball_scene.instance()


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func drop_ball():
	ball = ball_scene.instance()
	add_child(ball)
	
func _on_goal_timer_timeout():
	drop_ball()

func _on_goal_1_body_exited(body):
	body.queue_free()
	print("point")
	$goal_timer.start()



func _on_goal_2_body_exited(body):
	body.queue_free()
	print("point")
	$goal_timer.start()


func _on_HUD_start_game():
	$HUD/message_timer.start()
	yield(get_tree().create_timer(4.5), "timeout")
	drop_ball()
	

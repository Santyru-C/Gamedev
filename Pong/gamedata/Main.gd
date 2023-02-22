extends Node2D

var ball_scene = load("res://ball.tscn")
var ball = ball_scene.instance()
var p1_score = 0
var p2_score = 0 

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
func drop_ball():
	ball = ball_scene.instance()
	add_child(ball)
	
func new_game():
	
	clear_score()
	$HUD/message.show()
	$HUD/message_timer.start()
	yield(get_tree().create_timer(4.5), "timeout")
	drop_ball()
	
func game_over(winner):
	var format_string = "%s Wins"
	$HUD/message.text = format_string % winner
	$HUD/message.show()
	yield(get_tree().create_timer(2), "timeout")
	$HUD/message.hide()
	$HUD/start.show()
	
func _on_goal_timer_timeout():
	drop_ball()

func _on_goal_1_body_exited(body):
	body.queue_free()
	update_score("Player 2")

func _on_goal_2_body_exited(body):
	body.queue_free()
	update_score("Player 1")
	
func clear_score():
	p1_score = 0
	p2_score = 0
	$HUD/P1_score.text = str(0)
	$HUD/P2_score.text = str(0)
	
func update_score(point_to):
	if point_to == "Player 1":
		p1_score += 1
		$HUD/P1_score.text = str(p1_score)
		
	if point_to == "Player 2":
		p2_score += 1
		$HUD/P2_score.text = str(p2_score)
		
	check_winner(point_to)

func check_winner(last_goal):
	if p1_score == 5 or p2_score == 5:
		game_over(last_goal)
	
	else:
		$goal_timer.start()


extends KinematicBody2D
export (int) var speed = 400

var racket_position_y = Vector2()
var direction = Vector2()
var velocity = Vector2()

func _ready():
	pass

func follow(ball_position):
	racket_position_y = self.get_position().y
	if (ball_position - racket_position_y) < -5:
		direction.y = -1
	elif (ball_position - racket_position_y) > 5:
		direction.y = 1
	else:
		direction.y = 0
	
func _physics_process(_delta):
	var ball = get_tree().get_root().get_node("Main").ball
	
	if is_instance_valid(ball) and ball.get_position().x > 250:
		follow(ball.get_position().y)
	else:
		direction.y = 0
		
	velocity = move_and_slide(direction * speed)
	

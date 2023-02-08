extends KinematicBody2D

export (int) var speed = 200

var velocity = Vector2()

func get_input():
	velocity = Vector2()
	
	if Input.is_action_pressed("ui_right"):
		velocity.x += 100
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 100
	if Input.is_action_pressed("ui_down"):
		velocity.y += 100
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 100
	velocity = velocity * speed

func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)


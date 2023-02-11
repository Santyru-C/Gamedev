extends KinematicBody2D

export (int) var speed = 200

var direction = Vector2()
var velocity = Vector2()

func get_input():
	direction = Vector2()
	
	if Input.is_action_pressed("ui_up"):
		direction.y = -1
	
	if Input.is_action_pressed("ui_down"):
		direction.y = 1
	
	velocity = direction * speed
	
func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)
	print(velocity)


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

extends KinematicBody2D

export (int) var speed = 100

var rng = RandomNumberGenerator.new()
var initial_rotation = 0
var direction = Vector2()
var velocity = Vector2()

func _ready():
	rng.randomize()
	initial_rotation = rng.randf_range(-3.14, 3.14)
	direction = Vector2(1, 1).rotated(initial_rotation)
	
func _physics_process(delta):
	velocity = direction * speed
	var collides = move_and_collide(velocity * delta)
	
	if collides:
		direction = direction.bounce(collides.normal)
		speed += 25


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
	print("hello")

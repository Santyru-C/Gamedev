extends KinematicBody2D

export (int) var speed = 50

var rng = RandomNumberGenerator.new()
var initial_rotation = 1
var direction = Vector2()
var velocity = Vector2()

func _ready():
	rng.randomize()
	initial_rotation = 50#rng.randf_range(-3.14, 3.14)
	direction = Vector2(1, 1).rotated(initial_rotation)
	
func _physics_process(delta):
	velocity = direction * speed

	var collides = move_and_collide(velocity * delta)



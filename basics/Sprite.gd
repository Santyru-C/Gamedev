extends Sprite

func _init():
	print("I execute when the object is created in the memory")

var speed = 400
var angular_speed = 2 * PI

func _process(delta):
	rotation += angular_speed * delta
	var velocity = Vector2.UP.rotated(rotation) * speed
	position += velocity * delta


func _on_Button_pressed():
	set_process(not is_processing())

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
	
func _ready():
	var timer = get_node("Timer")
	timer.connect("timeout", self, "_on_Timer_timeout")
	
func _on_Timer_timeout():
	visible = not visible

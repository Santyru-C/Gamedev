extends CanvasLayer

signal start_game
var count = 0

func display_start_text(n):
	var text_lib = ["1", "2", "3", "Pong"]
	$message.text = text_lib[n]
	
func _ready():
	pass
#apretas el boton
#el boton desparece
#inicia el temporizador
#primer tick display 1
#segundo tick display 2
#tercer tick display 3
# cuarto tick display pong
# detener timer
#comienza el juego

func _on_message_timer_timeout():
	if count == 4:
		$message_timer.stop()
		$message.text = " "
		$message.hide()
	
	else:	
		display_start_text(count)
		count += 1
	


func _on_start_pressed():
	emit_signal("start_game")
	$start.hide()

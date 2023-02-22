extends CanvasLayer
signal start_game

var count = 0

func display_start_text(n):
	var text_lib = ["3", "2", "1", "Pong!"]
	$message.text = text_lib[n]
	
func _ready():
	pass

func _on_message_timer_timeout():
	print("timer started")
	print(count)
	# try using label.show()
	if count == 4:
		$message_timer.stop()
		$message.text = ""
		$message.hide()
		count = 0
	
	else:	
		display_start_text(count)
		count += 1
		
func _on_start_pressed():
	emit_signal("start_game")
	$start.hide()

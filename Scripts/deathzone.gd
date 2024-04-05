extends Area2D




func _on_body_entered(body):
	if body.name == "Flappy":
		body.kill()

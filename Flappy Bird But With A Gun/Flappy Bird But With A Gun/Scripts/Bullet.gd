extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x += 70


func _on_body_entered(body):
	pass

	#if body.name == "enemy":
	#	body.kill()
		


func _on_timer_timeout():
	self.queue_free()

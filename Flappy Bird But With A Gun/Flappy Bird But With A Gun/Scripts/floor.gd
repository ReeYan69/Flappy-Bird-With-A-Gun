extends CharacterBody2D






func _physics_process(delta):

	if Global.alive:
		velocity.x = - 100
	else:
		velocity.x = 0
	
	
#	if self.position.x < 1000:
#		queue_free()

	move_and_slide()


func _on_area_2d_body_entered(body):
	
	body.kill()
	





func _on_timer_timeout():
	self.queue_free()

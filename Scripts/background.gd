extends CharacterBody2D


var speed = 0


func _physics_process(delta):
	# Add the gravity.
	
	velocity.x = -speed; 
	
	
#	if self.position.x < 1000:
#		queue_free()

	move_and_slide()

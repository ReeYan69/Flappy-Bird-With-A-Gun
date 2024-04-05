extends CharacterBody2D


var explosionscene = load("res://Scenes/explosion.tscn")
var explosion = explosionscene.instantiate()
var alive = true 
func _physics_process(delta):
	# Add the gravity.

	if alive: 
		$AnimatedSprite2D.play("Flying")
		

	velocity.x = -Global.speed * 1.5 * delta 
	
	move_and_slide()


func kill():
	explosion = explosionscene.instantiate()
	$AudioStreamPlayer2D.play()
	add_child(explosion)
	alive = false 
	$AnimatedSprite2D.queue_free()
	$Area2D.queue_free()
	
	
	
	

	



func _on_area_2d_body_entered(body):
	if body.name == "Flappy":
		body.kill()
		kill()


func _on_area_2d_area_entered(area):

	print(len(str(area.name)))
	if len(str(area.name)) > 5:
		print(str(area.name)[0]+str(area.name)[1]+str(area.name)[2]+str(area.name)[3]+str(area.name)[4])
		if (str(area.name)[0]+str(area.name)[1]+str(area.name)[2]+str(area.name)[3]+str(area.name)[4]) == "Bulle" or (str(area.name)[0]+str(area.name)[1]+str(area.name)[2]+str(area.name)[3]+str(area.name)[4]) == "@Area" :
			area.queue_free()
			kill()

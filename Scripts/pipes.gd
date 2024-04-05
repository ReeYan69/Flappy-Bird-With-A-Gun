extends CharacterBody2D


var speed = Global.speed



func save(): 
	
	
	if not FileAccess.file_exists("user://HighScore.save"):
		var save_dict = {
			
			"score": 0 
			
		}	
		return save_dict
	else:
		
		var save_dict = {
			
			"score": Global.high_score
			
		}
		
		return save_dict



func save_score():
	var save_scores = FileAccess.open("user://HighScore.save",FileAccess.WRITE)
	
	var json_string = JSON.stringify(save())
	
	save_scores.store_line(json_string)

func _ready():
	$Timer.start()

func _physics_process(delta):
	# Add the gravity.
	var speed = Global.speed
	velocity.x = -speed * delta; 
	
	
#	if self.position.x < 1000:
#		queue_free()

	move_and_slide()







func _on_up_body_entered(body):

	print(Global.score)
	body.kill()


func _on_bp_body_entered(body):

	print(Global.score)
	body.kill()
	Global.speed = 0


func _on_score_detection_body_entered(body):
	Global.score += 1 
	if Global.score > Global.high_score:
		Global.high_score = Global.score
		save_score()
	$ScoreDetection/ScoreUpdated.play()




func _on_timer_timeout():
	self.queue_free()

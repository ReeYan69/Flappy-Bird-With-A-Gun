extends Node2D

var started = false
var movetitle = false 
var offscreen = false 



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
	
	
func load_game():
	if not FileAccess.file_exists("user://HighScore.save"):
		return
		
	var save_game = FileAccess.open("user://HighScore.save",FileAccess.READ)
	
	while save_game.get_position() < save_game.get_length():
		
		var json_string = save_game.get_line()
		var json = JSON.new()
		var parse_result = json.parse(json_string)
		var node_data = json.get_data()
		
		print(node_data["score"])
		
		
		
		
func _ready():
	Global.started = false 
	Global.inputignorance = false
	save_score()
	load_game()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	
	if not offscreen or Global.score < 0:
		$Score_UI.visible = false 
	else:
		$Score_UI.visible = true
	if movetitle and not offscreen: 
		
		$Title.position.x += -150 * delta
	if Global.alive and not started and not offscreen:
		$Title/start.queue_free()
		movetitle = true 
		started = true
		$Title_Timeout.start()
		

	if Global.alive == false and started: 
		
		Global.inputignorance = true 
		if $Timer.is_stopped():
			$Timer.start()



func _on_timer_timeout():
	print("e")
	get_tree().change_scene_to_file("res://Scenes/World.tscn")
	
	Global.score = 0 
	Global.speed = 5000
	Global.alive = false


func _on_title_timeout_timeout():
	if not offscreen:
		$Title.queue_free()
		offscreen = true 
	else:
		$Title_Timeout.queue_free()

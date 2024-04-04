extends Node




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
		
		
		return node_data["score"]
		
		
var score = 0 
var speed = 5000
var alive = false
var started = false
var inputignorance = false
var position = 0
var high_score = load_game()

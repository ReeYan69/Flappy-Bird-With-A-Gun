extends Node2D

var started = false
var movetitle = false 
var offscreen = false 



		
		
		
func _ready():
	Global.started = false 
	Global.inputignorance = false



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	
	if not offscreen or Global.score < 0:
		$Score_UI.visible = false 
	else:
		$Score_UI.visible = true
	if movetitle and not offscreen: 
		
		$Title.position.x += -250 * delta
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

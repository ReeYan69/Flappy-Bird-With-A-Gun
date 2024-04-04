extends Node2D

var max = 500
var PipeScene = load("res://Scenes/pipes.tscn")
var Pipe = PipeScene.instantiate()
var rng = RandomNumberGenerator.new()
# Called when the node enters the scene tree for the first time.

var started = Global.started



func _ready():
	started = Global.started
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	if Global.alive and not started:
		
		$Marker2D.add_child(Pipe)

		$Timer.start()
		$Timer_time_change.start()
		started = true


func _on_timer_timeout():
	if Global.alive:
		if Global.speed < max:
			Global.speed += 100
		Pipe = PipeScene.instantiate()
		$Marker2D.add_child(Pipe)
		var my_random_number = rng.randf_range(-75.0, 75.0)
		Pipe.position.y += my_random_number
		$Timer.start()


func _on_timer_time_change_timeout():
	if Global.speed < max and Global.alive:
		$Timer.wait_time += -0.2
	$Timer_time_change.start()

extends Node2D

var floorScene = load("res://Scenes/floor.tscn")
var make = floorScene.instantiate()

# Called when the node enters the scene tree for the first time.
func _ready():
	make.position = $Marker2D.position
	$Marker2D.add_child(make)
	$Timer.start()

	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	
	if Global.alive:
		make = floorScene.instantiate()
		$Marker2D.add_child(make) 
		$Timer.start()

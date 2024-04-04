extends Node2D

var max = 500
var EnemyScene = load("res://Scenes/enemy.tscn")
var Enemy = EnemyScene.instantiate()
var rng = RandomNumberGenerator.new()
# Called when the node enters the scene tree for the first time.

var started = Global.started



func _ready():
	started = Global.started
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	if Global.alive and not started:
		Enemy = EnemyScene.instantiate()
		$Marker2D.add_child(Enemy)

		$Timer.start()
		$Timer2.start()
		started = true


func _on_timer_timeout():
	if Global.alive:

		Enemy = EnemyScene.instantiate()
		$Marker2D.add_child(Enemy)
	
		Enemy.position.y = Global.position
		$Timer.start()





func _on_timer_2_timeout():
	if Global.speed < max and Global.alive:
		$Timer.wait_time += -0.2
		$Timer2.start()

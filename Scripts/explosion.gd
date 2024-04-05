extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$CPUParticles2D.modulate = Color(255,0,0)
	$Timer.start()





func _on_timer_timeout():
	self.queue_free()

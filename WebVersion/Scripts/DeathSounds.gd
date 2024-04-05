extends Node2D
var rng = RandomNumberGenerator.new()
var sound = rng.randf_range(1, 3)
# Called when the node enters the scene tree for the first time.
func _ready():
	
	if int(sound) == 1:
		$Explosion1.play()
	elif int(sound) == 2:
		$Explosion2.play()
	else:
		$Explosion3.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

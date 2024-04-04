extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$Current_Score.text = str(Global.score)
	$High_Score.text = str(Global.high_score)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Current_Score.text = str(Global.score)
	$High_Score.text = "HS: " + str(Global.high_score)

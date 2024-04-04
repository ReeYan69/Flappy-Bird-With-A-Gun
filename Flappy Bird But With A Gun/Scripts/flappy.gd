extends CharacterBody2D

var alive = false
var started = false
var player = true
var enemy = false
var bullet = false
const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var explosionscene = load("res://Scenes/explosion.tscn")
var explosion = explosionscene.instantiate()
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = 10
var rng = RandomNumberGenerator.new()


var BulletScene = load("res://Scenes/bullet.tscn")
func _ready():
	var animation = $AnimatedSprite2D
	animation.play("Flying")
	Global.started = false 
func _physics_process(delta):

	if alive and started:
		Global.position = $AnimatedSprite2D.position.y

	if alive:
		if velocity.y != gravity:
			velocity.y += gravity * 0.1 * delta 
		velocity.y += gravity 
		if Input.is_action_just_pressed("click"):
			jump(gravity * 30)
			
		if Input.is_action_just_pressed("shoot"):
			var bullet = BulletScene.instantiate()
			owner.add_child(bullet)
			$Sounds/shot.play()
			bullet.transform = $bullet_spawn.global_transform
			pass
			
		if velocity.y < 0 and alive and Global.started:
			$AnimatedSprite2D.set_rotation(-PI/4)
		elif velocity.y == 0 and alive and Global.started:
			$AnimatedSprite2D.set_rotation(0)
			
		elif velocity.y > 0 and alive and Global.started:
			$AnimatedSprite2D.set_rotation(PI/4)
			
	if Input.is_action_just_pressed("click") and not alive and not started and not Global.inputignorance:
		jump(gravity * 30)
		
		alive = true 
		Global.alive = true
		Global.started = true
	


	move_and_slide()
	
	
	
	
	


func jump(amount):
	
	velocity.y = -amount  
	self.rotation = -0.0174533
	$Sounds/flap.play()


func kill():
	explosion = explosionscene.instantiate()
	
	add_child(explosion)
	
	var sound = rng.randf_range(1, 3)
	
	if int(sound) == 1: 
		$DeathSounds/Explosion1.play()
	elif int(sound) == 2:
		$DeathSounds/Explosion2.play()
	elif int(sound) == 3:
		$DeathSounds/Explosion3.play()
		
		
	if alive:
		alive = false
		
		$AnimatedSprite2D.queue_free()
		$Sprite2D.queue_free()
		$CollisionShape2D.queue_free()
		Global.alive = false
		Global.speed = 0
	#$Sprite2D.queue_free()

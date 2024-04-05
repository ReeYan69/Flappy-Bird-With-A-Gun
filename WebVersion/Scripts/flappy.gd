extends CharacterBody2D

var alive = false
var started = false
var player = true
var enemy = false
var bullet = false

var loaded = true 
var loading = false 
const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var explosionscene = load("res://Scenes/explosion.tscn")
var explosion = explosionscene.instantiate()
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = 10

var SoundScene = load("res://Scenes/DeathSounds.tscn")

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
		if Input.is_action_just_pressed("click") and alive:
			jump(gravity * 30)
			
		if Input.is_action_just_pressed("shoot") and alive:
			
			if loaded:
				var bullet = BulletScene.instantiate()
				owner.add_child(bullet)
				$Sounds/shot.play()
				bullet.transform = $bullet_spawn.global_transform
				loaded = false 
				
			elif not loaded and not loading:
				loading = true 
				$Sounds/Reload.play()
			
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
	
	owner.add_child(explosion)
	explosion.position = self.position
	

	var Sound = SoundScene.instantiate()
	owner.add_child(Sound)
		
	if alive:

		Global.alive = false
		Global.speed = 0
		self.queue_free()
		
	#$Sprite2D.queue_free()


func _on_reload_finished():
	loaded = true 
	loading = false 


func _on_explosion_3_finished():
	Global.alive = false
	self.queue_free() # Replace with function body.


func _on_explosion_2_finished():
	Global.alive = false
	self.queue_free() # Replace with function body.


func _on_explosion_1_finished():
	Global.alive = false
	self.queue_free() # Replace with function body.

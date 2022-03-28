extends KinematicBody2D

var speed = 600
var velocity = Vector2.ZERO
var GameOn = false 

func _ready():
	start_ball()
	
		
func _physics_process(delta):
	var collision_object = move_and_collide(velocity * speed * delta)
	if collision_object:
		velocity = velocity.bounce(collision_object.normal)
		$CollisionSound.play()
	if Input.is_action_pressed("ui_accept"):
		stop_ball()
		
func stop_ball():
	speed = 0

func restart_ball():
	stop_ball()
	global_position = Vector2(640,360)
	
func start_ball():
	stop_ball()
	velocity.x = [-1,1][randi() % 2]
	velocity.y = [-0.8,0.8][randi() % 2]
	speed = 600



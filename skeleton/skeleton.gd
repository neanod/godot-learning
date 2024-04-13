extends CharacterBody2D


var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var anim = $AnimatedSprite2D

var chase = false
var speed = 100
@onready var player = $"../player"
func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	var direction = (player.position - self.position).normalized()
	if chase== true:
		velocity.x = direction.x *speed
		anim.play("run")
	else:
		velocity.x = 0
		anim.play("idle")
	move_and_slide()
		
func _on_detector_body_entered(body):
	if body.name == "player":
		chase = true


func _on_detector_body_exited(body):
	if body.name == "player":
		chase = false


func _on_death_body_entered(body):
		if body.name == "player":
			death()
			
func death ():
	anim.play("death")
	queue_free()


func _on_area_2d_body_entered(body):
	pass # Replace with function body.

extends CharacterBody2D


var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var anim = $AnimatedSprite2D

var chase = false
@onready var player = $"../player"
var speed = 100

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

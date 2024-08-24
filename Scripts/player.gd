extends CharacterBody2D

@export var movement_speed :=40.0
@export var health := 80

@onready var sprite := $Sprite




func _physics_process(delta):
	movement()

func _process(delta):
	pass

func movement() -> void:
	var x_mov := Input.get_action_strength("right") - Input.get_action_strength("left")
	var y_mov := Input.get_action_strength("down") - Input.get_action_strength("up")
	var mov :=  Vector2(x_mov,y_mov)
	
	if x_mov > 0:
		sprite.flip_h = true
	elif x_mov < 0 :
		sprite.flip_h = false
		
	if mov != Vector2.ZERO:
		sprite.play("Walking")
	else:
		sprite.play("Idle")
		
	velocity = mov.normalized() * movement_speed
	move_and_slide()


func _on_hurt_box_hurt(damage):
	health -= damage
	print("Player Health: %s" % health)

extends CharacterBody2D

@export var movement_speed :=20.0
@export var health := 10

@onready var player : CharacterBody2D = get_tree().get_first_node_in_group("player")
@onready var sprite := $Sprite

func _physics_process(_delta):
	
	var direction = global_position.direction_to(player.global_position)
	
	if direction.x > 0.1:
		sprite.flip_h = true
	elif direction.x < -0.1:
		sprite.flip_h = false
		
	velocity = direction * movement_speed
	move_and_slide()


func _on_hurt_box_hurt(damage):
	health -= damage
	print("Kobold HP: %s" % health)
	if health < 1:
		queue_free()

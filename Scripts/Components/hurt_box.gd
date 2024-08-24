extends Area2D

@export_enum("Cooldown","HitOnce","DisableHitBox") var hurtBoxType := 0

@onready var collision = $CollisionShape2D
@onready var disable_timer = $DisableTimer

signal hurt(damage)


func _on_area_entered(area):
	if area.is_in_group("attack"):
		if not area.get("damage")==null:
			match hurtBoxType:
				0: #cooldown
					collision.call_deferred("set","disabled",true)
					disable_timer.start()
				1: #hitonce
					pass
				2: #disableHitBox
					if area.has_method("tempdisable"):
						area.tempdisable()
			var damage = area.damage
			emit_signal("hurt",damage)

func _on_disable_timer_timeout():
	collision.call_deferred("set","disabled",false)

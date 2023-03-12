class_name Spieler
extends CharacterBody2D

const gravity = 8.1
const speed = 50
const jump_force = -240

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity

	if Input.is_action_pressed("links"):
		velocity.x = -speed
		$AnimatedSprite2D.flip_h = false
		$AnimatedSprite2D.play("laufen")
	elif Input.is_action_pressed("rechts"):
		velocity.x = speed
		$AnimatedSprite2D.flip_h = true
		$AnimatedSprite2D.play("laufen")
	else:
		velocity.x = 0
		$AnimatedSprite2D.play("stehen")

	if Input.is_action_just_pressed("springen") and is_on_floor():
		$JumpSound.play()
		velocity.y = jump_force

	move_and_slide()

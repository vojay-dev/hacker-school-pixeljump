extends Node2D

var leben = 3

func game_over():
	$GUI/CenterContainer/GameOver.visible = true

	$Spieler.set_physics_process(false)

	$Spieler/Camera2D/AnimationPlayer.play("shake")
	await $Spieler/Camera2D/AnimationPlayer.animation_finished
	get_tree().reload_current_scene()

func gewonnen():
	$GUI/CenterContainer/Gewonnen.visible = true

	$Spieler.set_physics_process(false)

	$Spieler/Camera2D/AnimationPlayer.speed_scale = 1
	$Spieler/Camera2D/AnimationPlayer.play("zoom")
	await $Spieler/Camera2D/AnimationPlayer.animation_finished
	get_tree().reload_current_scene()

func _on_ziel_body_entered(body):
	if body is Spieler:
		gewonnen()

func spieler_auf_start():
	$Spieler.set_physics_process(false)

	$Spieler/Camera2D/AnimationPlayer.play("shake")
	await $Spieler/Camera2D/AnimationPlayer.animation_finished
	$Spieler.position = $SpielerStart.position

	$Spieler.set_physics_process(true)

func _on_abgrund_spieler_heruntergefallen():
	leben -= 1
	if leben == 2:
		$GUI/GridContainer/Heart3.visible = false
		spieler_auf_start()
	elif leben == 1:
		$GUI/GridContainer/Heart2.visible = false
		spieler_auf_start()
	else:
		$GUI/GridContainer/Heart1.visible = false
		game_over()

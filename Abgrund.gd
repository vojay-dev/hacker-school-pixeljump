extends Area2D

signal spieler_heruntergefallen

func _on_body_entered(body):
	if body is Spieler:
		emit_signal("spieler_heruntergefallen")

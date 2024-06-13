extends Node2D

signal expForPlayer(job, exp)
signal lootForUi(count, item)


func _ready():
	get_tree().paused = false


func _process(delta):
	pass



func _on_minerals_destroyed(job, experience, count, item):
	expForPlayer.emit(job, experience)
	lootForUi.emit(count, item)

extends Node2D

signal expForPlayer(job, exp)
signal lootForUi(count, item)


func _ready():
	get_tree().paused = false
	EventBus.destroyed.connect(_on_minerals_destroyed)


func _process(delta):
	pass



func _on_minerals_destroyed(job, experience, count, item):
	print("Is destroyed")
	expForPlayer.emit(job, experience)
	lootForUi.emit(count, item)

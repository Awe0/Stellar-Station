extends Control

@onready var animation = $AnimatedSprite2D

func _ready():
	animation.play("40")


func _process(delta):
	pass

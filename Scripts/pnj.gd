extends Node2D

@onready var animation = $AnimatedSprite2D

var playerOnRang: bool = false

func _ready():
	animation.play("idle")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_interaction_area_body_entered(body):
	if body.is_in_group("player"):
		playerOnRang = true


func _on_interaction_area_body_exited(body):
	playerOnRang = false

func _on_player_input_interaction_just_pressed():
	if playerOnRang == true:
		print("hello")

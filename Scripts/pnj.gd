extends Node2D

signal interaction(who : String)

@export_enum("nobody", "spaceCat") var selected_animation: String

@onready var animation = $AnimatedSprite2D

var playerOnRang: bool = false

func _ready():
	displaySelectedAnimation()

func displaySelectedAnimation():
	animation.play(selected_animation)

func _on_interaction_area_body_entered(body):
	if body.is_in_group("player"):
		playerOnRang = true

func _on_interaction_area_body_exited(body):
	playerOnRang = false

func _on_player_input_interaction_just_pressed():
	if playerOnRang == true:
		interaction.emit(selected_animation)

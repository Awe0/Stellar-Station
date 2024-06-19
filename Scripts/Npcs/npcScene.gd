extends Node2D

signal interaction(who : Object)

@export_enum("nobody", "SpaceCat") var selected_animation: String

@onready var animation = $AnimatedSprite2D

var playerOnRang : bool = false
var whichNpcIs : Object

func _ready():
	displaySelectedAnimation()
	whichNpcIs = takeTheRightNpc()

func displaySelectedAnimation():
	animation.play(selected_animation)

func _on_interaction_area_body_entered(body):
	if body.is_in_group("player"):
		playerOnRang = true

func _on_interaction_area_body_exited(body):
	playerOnRang = false

func _on_player_input_interaction_just_pressed():
	if playerOnRang == true:
		interaction.emit(whichNpcIs)

func takeTheRightNpc():
	for npc in NpcsInstance.npcs:
		if selected_animation == npc.pnjsName:
			return npc

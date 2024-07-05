extends Node2D

signal interaction(who : Object)

@export_enum("Nobody", "SpaceCat") var selected_animation: String

@onready var animation = $AnimatedSprite2D

var playerOnRange : bool = false
var whichNpcIs : Object

func _ready():
	displaySelectedAnimation()
	whichNpcIs = defineTheRightNpc()
	print(whichNpcIs.questsId)

func displaySelectedAnimation():
	animation.play(selected_animation)

func _on_interaction_area_body_entered(body):
	if body.is_in_group("player"):
		playerOnRange = true

func _on_interaction_area_body_exited(body):
	if body.is_in_group("player"):
		playerOnRange = false

func _on_player_input_interaction_just_pressed():
	if playerOnRange == true:
		interaction.emit(whichNpcIs)

func defineTheRightNpc():
	for npc in NpcsInstance.npcs:
		if selected_animation == npc.npcName:
			return npc




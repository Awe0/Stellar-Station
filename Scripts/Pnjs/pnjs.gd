extends Node2D

signal pnjsAreCreated(pnjs : Object)
signal interaction(who : String)

@export_enum("nobody", "spaceCat") var selected_animation: String

@onready var animation = $AnimatedSprite2D

var pnjs : Array
var playerOnRang: bool = false

func _ready():
	pnjs = loadPnjs()
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

func loadPnjs():
	var pnjs :Array
	var dataFilePath : String = "res://PNJsDial.json"
	var loadDatas : Object = DataLoader.new()
	var pnjsData : Dictionary = loadDatas.load_json_file(dataFilePath)
	for key in pnjsData:
		var value = pnjsData[key]
		for i in value:
			pnjs.append(Pnj.new(i))
	return pnjs
